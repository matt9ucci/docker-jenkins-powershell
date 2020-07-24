ARG jenkins_tag=lts
FROM jenkins/jenkins:${jenkins_tag}

# To run apt
USER root

# Install required packages
RUN apt-get update \
 && apt-get install -y apt-transport-https \
 && rm -rf /var/lib/apt/lists/*

# Install PowerShell from Microsoft’s repository
# The jenkins:lts image is based on Debian 9 (Stretch)
# For information about how to install PowerShell in Debian 9, see the following link:
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6#debian-9
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
 && apt-get update \
 && apt-get install -y powershell \
 && rm -rf /var/lib/apt/lists/*

# Drop back to the jenkins user
USER jenkins
