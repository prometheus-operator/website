This project is licensed under the [Apache 2.0 license](LICENSE) and accept
contributions via GitHub pull requests. This document outlines some of the
conventions on development workflow, commit message formatting, contact points
and other resources to make it easier to get your contribution accepted.

To maintain a safe and welcoming community, all participants must adhere to the
project's [Code of Conduct](code-of-conduct.md).

## Getting Started

- Fork the repository on GitHub.  
- Read the [README](https://github.com/prometheus-operator/website/blob/main/README.md) for build and test instructions.  
- Explore the project, submit bugs, and contribute patches!

---

## Contribution Flow

### 1. Source of Documentation

All documentation for this site comes from source repositories like [prometheus-operator](https://github.com/prometheus-operator/prometheus-operator) or [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus).

> This repository does **not** maintain documentation directly.

Documentation is synchronized from the source repositories using the [`synchronize.sh`](https://github.com/prometheus-operator/website/blob/main/synchronize.sh) script. This script defines:

- Which repositories to pull content from.
- Where the documentation should be placed in this repository.

---

### 2. Workflow for Making Documentation Changes

To receive faster and more effective reviews from the maintainers, follow this approach when creating a pull request:

1. Create a branch in the **source repository** and make your changes there (e.g., `doc-update`).

2. Submit a pull request to the source repository with your changes. This PR will contain the actual documentation updates.

3. Create a new branch in this repository (e.g., `preview-doc-update`).

4. Modify [`synchronize.sh`](https://github.com/prometheus-operator/website/blob/main/synchronize.sh) temporarily to point to your branch (`doc-update`) in the source repository.

5. Before creating a pull request, run the `make` command to update the latest changes from your branch (`doc-update`).

6. Commit the updated files and open a pull request in this repository to provide a **live preview** of your documentation changes.

7. After your branch in the source repository is merged, revert the branch reference in [`synchronize.sh`](https://github.com/prometheus-operator/website/blob/main/synchronize.sh) back to the `main` branch.

8. Run the `make` command again and push the final changes for review and merge.

---

### 3. Styling

This project uses the Doks theme for styling. Theme files are located in the `themes/` directory.

In some cases, you might need to create custom components to achieve a particular style. It is recommended to add or modify templates in the `themes/doks/layouts/` folder when needed.

---

## Communication and Meetings

To reach out to the community, please refer to [Contributing Guidelines in Prometheus-Operator](https://github.com/prometheus-operator/prometheus-operator/blob/main/CONTRIBUTING.md#email-and-chat).