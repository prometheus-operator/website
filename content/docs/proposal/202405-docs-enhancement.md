# Revamping Documentation Structure

- Owners:
  - [AshwinSriram11](https://github.com/AshwinSriram11)
- Related Tickets:
- Other docs:
  - N/A

This document proposes restructuring the documentation of the Prometheus-Operator website, aiming for better content organization and better experience for new users and old veterans.

# Why

It is important to keep the documentation of a project updated with the development process so that all features, enhancements are incorporated in the documentation properly. For that, the basic structure for the documentation should be intuitive so that further additions to the documentation is easier. 

# Pitfalls of the current solution

A good documentation is one that is easy to understand for a newcomer and provides exact amount of information that is needed according to the need. But looking at the current documentation structure, a lot of topics seem misplaced. For example, there is no need of "Contributing" page in the prologue section. Prologue section should only give the introduction and the pre-requisites for the project. Due to this, a user might need to put more effort to search for relevant information and decrease user's productivity.

Flow of content should also be uniform. 


* Disorganized arrangement of topics due to which it becomes difficult to search for essential information according to the requirement.
* Navigating through the current structure becomes tedious and decreases productivity.
* Lack of clarity according to the various user personas, such as users, administrators and contributors.

# Goals

* To improve readability and make the documentation easier to understand.
* To save user's time by streamlining navigation process by intuitive structuring.

# Audience

* Developers who rely on Prometheus Operator to facilitate the deployment, management and monitoring of Prometheus instances in their environment.
* Developers who want to setup alerts for their application.
* Administrators who want to monitor Prometheus and Alertmanager instances using Kubernetes tools.
* Maintainers who are responsible for optimizing Prometheus Operator.
* Contributors who want to engage and want to contribute effectively to the project.

# Non-Goals

* Adding extra documentation about new features, enhancements, troubleshooting, or other information that might be missing today. 

# How

I believe a basic structure for the website should be as given below:
### 1. Getting Started
  * #### Introduction
     This section will introduce us to Prometheus-Operator and will talk about goals of this project and the problems that are being solved by this project.
  * #### Installation Guide
     This section will contain all the methods of installation of Prometheus-Operator in you local environment.
### 2. API Reference
   This section will provide detailed information about different fields of the Custom Resources in Prometheus-Operator(config, spec, status and other information).    
### 3. User Guide
   This section will provide focused information for developers who want to integrate Prometheus and Alertmanager using Prometheus-Operator in their applications along with examples and trobleshooting.
### 4. Administrator Guide
   This section will provide deeper insights for administrators who want to setup a robust, secure monitoring infrastructure. 
### 5. Community
  * #### Contributing
  * #### Testing
  * #### DCO
  * #### License
  * #### Code of Conduct
  * #### Release
  * #### Adopters
 
# Alternatives


# Action Plan

1. Making sections and organizing files as described above.
2. If needed, splitting the content of one file into multiple files to improve readability or changing the location of content wherever required.
3. Removing content that is unnecessary for the project.

