## Evaluating Puppet Enterprise

This repository is built to be a guideline for beginning with Puppet Enterprise.


### Downloading Puppet Enterprise

To get started we will be installing the evaluation version of Puppet Enterprise. This is the same as the normal licensed copy of Puppet Enterprise and comes with 10 free licenses for your use. You can obtain the latest copy of this code from [here](https://puppetlabs.com/download-puppet-enterprise).

### System Requirements

For a small evaluation environment a full deployment is not necessary. The recommendation for an evaluation environment is at a minimum:
- 2 CPU Cores
- 6GB Memory
- 20GB of free space in /opt
- 10GB of free space in /var

This is roughly equivalent to an m3.large instance in AWS.

Alternatively for a bit more performance at levels similar to a full production installation, you can proceed with the following:
- 4 CPU Cores
- 8GB Memory
- 100GB of free space in /opt
- 10GB of free space in /var

This would be equivalent to a m3.xlarge or m4.xlarge instance in AWS.

The Puppet Enterprise master installation must take place on a Linux node, even though other system types can be managed. Supported master platforms include Red Hat Enterprise Linux, CentOS, Oracle Linux, Scientific Linux, SUSE Linux Enterprise Server, and Ubuntu.

### Recommendations

Having a git version control server in place is very helpful for speedy code deployments with Puppet. For this reason, it is recommended strongly that you have a git server available for use. Some common ones used with Puppet are Github, Gitlab, and Stash.

### Installation Steps

We will closely be following the installation steps outlined in the [official documentation](http://docs.puppetlabs.com/pe/latest/install_pe_mono.html#installing-puppet-enterprise:-monolithic) with few exceptions. If you have a git server in place, you can bootstrap your installation through the use of the [puppetlabs/control-repo](https://github.com/puppetlabs/control-repo) that is available on GitHub. This will be easiest to utilize by cloning this to your local git repository.

Also, please take careful note of the [prerequisites](http://docs.puppetlabs.com/pe/latest/install_pe_mono.html#general-prerequisites-and-notes). Missing any of these can lead to installation problems that can potentially necessitate a reinstall later.

If utilizing the repository, follow the steps outlined [here](https://github.com/puppetlabs/control-repo#how-to-set-it-all-up) (substituting your own repository when appropriate). Otherwise, please simply extract the tarball downloaded earlier, change into the directory where the package was extracted, and run the puppet-enterprise-installer to begin the installation. After downloading some prerequisites, you will be able to navigate to the installer's web interface on port 3000 of the host. The web based wizard should guide you through the remainder of the process.
