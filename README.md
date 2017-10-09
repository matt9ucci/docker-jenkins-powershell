# Jenkins + PowerShell Dockerfile

To make it easy to start PowerShell scripting in Jenkins Pipeline.

Based on [Jenkins official image](https://hub.docker.com/r/jenkins/jenkins/).
Installed [PowerShell](https://github.com/PowerShell/PowerShell) from Microsoft’s repository.

## Background

On July 2017, Microsoft PowerShell support for Jenkins Pipeline was [announced](https://jenkins.io/blog/2017/07/26/powershell-pipeline/).
However, Jenkins official image does not contain PowerShell.

## Usage

### Build
LTS
```
docker build --tag jenkins-powershell:lts .
```
Specific Version
```
docker build --tag jenkins-powershell:2.73.1 --build-arg jenkins_tag=2.73.1 .
```

### Run
LTS, ephemeral
```
docker run -d -p 8080:8080 -p 50000:50000 --rm matt9ucci/jenkins-powershell:lts
```

LTS with volume
```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-ps -v jenkins_home:/var/jenkins_home matt9ucci/jenkins-powershell:lts
```

Jenkins version
```
docker run --rm matt9ucci/jenkins-powershell:lts --version
```
