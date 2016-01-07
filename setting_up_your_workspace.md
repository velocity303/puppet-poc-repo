## Setting up your vagrant environment

### What is vagrant

Vagrant is a tool that allows you to (in the words of their own site) "create and configure lightweight, reproducible, and portable development environments" easily. With that being the case, it is a great tool for testing your Puppet code locally on your machine as well as for development.

You can read more about vagrant at their official page [here](https://www.vagrantup.com/).

### Downloading an environment

There are a couple of example vagrant environments that you can use for local development.

#### Npwalker's Vagrant & Control Repostory
https://github.com/npwalker/control-repo-vagrant

### Instructions for Npwalker's Vagrant and Control Repository

1. Install Vagrant ([installation documentation](https://docs.vagrantup.com/v2/installation/))
2. Install Virtualbox ([Virtualbox Download](https://www.virtualbox.org/wiki/Downloads))
3. Install required vagrant plugins for usage:
```
  $ vagrant plugin install oscar
  $ vagrant plugin install vagrant-hosts
  $ vagrant pluing install vagrant-reload
  $ vagrant plugin install vagrant-multiprovider-snap
```
4. Clone npwalker's control repository to a local directory on your workstation.
