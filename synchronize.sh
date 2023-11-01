#!/usr/bin/env bash

# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value.
set -eo pipefail

# Remove artefacts.
rm -rf repos/

# Create directories.
mkdir repos/

# Clone repos or use local copies.
if [[ -n "$PO_PATH" ]] && [[ -d "$PO_PATH" ]]; then
  ln -s "$PO_PATH" repos/prometheus-operator
else
  git clone https://github.com/prometheus-operator/prometheus-operator -b main --depth 1 repos/prometheus-operator
fi

if [[ -n "$KUBE_PROMETHEUS_PATH" ]] && [[ -d "$KUBE_PROMETHEUS_PATH" ]]; then
  ln -s "$KUBE_PROMETHEUS_PATH" repos/kube-prometheus
else
  git clone https://github.com/prometheus-operator/kube-prometheus -b main --depth 1 repos/kube-prometheus
fi

# Show pinned revisions.
for r in repos/prometheus-operator repos/kube-prometheus; do
  echo "$r@""$(cd $r && git rev-parse HEAD)"
done

# Copy dependant sections and metadata.
cp -f repos/prometheus-operator/ADOPTERS.md content/adopters.md
cp -f repos/prometheus-operator/CONTRIBUTING.md content/docs/prologue/contributing.md
cp -fr repos/prometheus-operator/Documentation/img static/img
cp -fr repos/prometheus-operator/Documentation/user-guides/ content/docs/user-guides/
cp -fr repos/prometheus-operator/Documentation/ content/docs/operator/
cp -fr repos/kube-prometheus/docs/ content/docs/kube/

# One-off fixes so as to not break links.
cp -f repos/prometheus-operator/Documentation/user-guides/storage.md content/docs/operator/storage.md
cp -f repos/prometheus-operator/Documentation/user-guides/strategic-merge-patch.md content/docs/operator/strategic-merge-patch.md
cp -f repos/kube-prometheus/docs/customizations/developing-prometheus-rules-and-grafana-dashboards.md content/docs/kube/developing-prometheus-rules-and-grafana-dashboards.md
cp -f repos/kube-prometheus/docs/customizations/exposing-prometheus-alertmanager-grafana-ingress.md content/docs/kube/exposing-prometheus-alertmanager-grafana-ingress.md



# Remove invalid files without front matter.
find content/docs -type f -name "*.md" -print0 | while IFS= read -r -d '' file; do
  # Prevent awk from failing the script if the file is empty.
  set +e
  # For each line in the file:
  # * BEGIN: Set p to 0 and exitcode to 0.
  # * !p && NF: If p is 0 and the number of fields is not 0 (i.e. the line is not empty):
  #   * if ($0 != "---"): If the line is not "---", set exitcode to 1 and exit.
  #   * else: Set p to 1 and skip to the next line.
  # * p && /---/: If p is 1 and the line is "---", set p to 2.
  # * END: If p is not 2, set exitcode to 1.
  # Note how p is used to move from the first part of the conditional to the next (p && ..., otherwise it will keep checking the first condition until EOF).
  awk 'BEGIN {p=0; exitcode=0} !p && NF { if ($0 != "---") {exitcode=1; exit} else {p=1; next} } p && /---/ {p=2} END {if (p != 2) exitcode=1; exit exitcode}' "${file}" > /dev/null
  EXITCODE=$?
  set -e
  # Prepend zero-length front matter if the file is invalid.
  if [ "$EXITCODE" -ne 0 ]; then
    TMPFILE=$(mktemp)
    TITLE=$(\
    # Remove .md extension.
    basename "${file}" .md |\
    # Replace dashes with spaces.
    sed 's/-/ /g' |\
    # First, positive lookbehind from non-whitespace character for a whitespace.
    # Then, convert each word to lowercase.
    # Finally, convert the first letter of each word to uppercase and add a whitespace.
    perl -ne 'print ucfirst(lc($_))." " for split /(?<=\S)\s+/')
    echo -e "---\ntitle: ${TITLE}\n---\n" > "$TMPFILE"
    cat "$file" >> "$TMPFILE"
    mv "$TMPFILE" "$file"
  fi
done

# Prevent grep from failing the script.
set +e

# Sanitize links by replacing immediate filenames with relative (to /docs references).
find ./content/docs -name "*.md" | while IFS= read -r file
do
    # Extract markdown links (in the format [text](link.md)) from the current file.
    grep -oE '\]\([^/)]*\.md\)' "${file}" | while IFS= read -r link
    do
        dirName=$(dirname "${file}")
        sanitizedLink=$(echo "${link}" | tr -d "]()" | sed 's/\.md//')
        original="](${sanitizedLink}.md)"
        sanitizedLinkWithPath="${dirName}/${sanitizedLink}"
        modified="](/docs/${sanitizedLinkWithPath#./content/docs/}/)"
        sed -i '' -e "s|${original}|${modified}|g" "${file}"
    done
done

set -e
