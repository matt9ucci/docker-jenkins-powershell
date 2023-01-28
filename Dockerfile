ARG jenkins_tag=lts
FROM jenkins/jenkins:${jenkins_tag}

# To run apt
USER root

RUN set -x \
# Install required packages
 && apt-get -qq update \
 && apt-get -qq -o Dpkg::Use-Pty=0 install --no-install-recommends -y curl gnupg apt-transport-https \
# Install PowerShell from Microsoft’s repository
# The jenkins:lts image is based on Debian 11 "bullseye"
# For information about how to install PowerShell in Debian 11, see the following link:
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian#installation-on-debian-11-via-package-repository
 && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list' \
 && apt-get update \
 && apt-get install -y powershell \
 && rm -rf /var/lib/apt/lists/*

# Drop back to the jenkins user
USER jenkins
