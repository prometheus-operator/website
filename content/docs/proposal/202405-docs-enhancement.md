# Revamping Documentation Structure

- Owners:
- [AshwinSriram11](https://github.com/AshwinSriram11)
- Related Tickets:
- Other docs:
- N/A

This document aims to restructure the documentation of Prometheus Operator website for improving content organization.

# Why

It is important to keep the documentation of a project updated with the development process so that all features, enhancements are incorporated in the documentation properly. For that, the basic structure for the documentation should be intuitive so that further additions to the documentation is easier. 
# Pitfalls of the current solution

* Disorganized arrangement of topics due to which it becomes difficult to search for essential information according to the requirement.
* Navigating through the current structure becomes tedious and decreases productivity.
* Lack of clarity according to the various user personas, such as users, administrators and contributors.

# Goals

* To streamline navigation process by intuitive structuring.
* Proper segregation of information according to the persona.

# Audience

* Developers/Engineers who rely on Prometheus Operator to facilitate the deployment, management and monitoring of Prometheus instances in their environment.
* Administrators who are responsible for optimizing Prometheus Operator.
* Contributors who want to engage and want to contribute effectively to the project.

# Non-Goals

* This proposal only aims for improving content organization of the website.
* It does not address other documentation issues regarding adding information about new feature, enhancement, troubleshooting, etc. 

# How

I believe a basic structure for the website should be as given below:
* Getting Started
  * Introduction
  * Installation Guide
* API Reference
* User Guide
* Administrator Guide
* Community
  * Contributing
  * Testing
  * DCO
  * License
  * Code of Conduct
  * Release
  * Adopters

I also think that Kube-Prometheus should be removed from the docs because:
* It is a seperate project from Prometheus Operator.
* It is not currently being supported by the community so it gives rise to more issues.

# Alternatives


# Action Plan

1. Making sections and organizing files as described above.
2. If needed, splitting the content of one file into multiple files to improve readability or changing the location of content wherever required.
3. Removing content that is unnecessary for the project.

