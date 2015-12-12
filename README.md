# vagrant-gitlab
A Vagrant environment for
[GitLab Community Edition](https://gitlab.com/gitlab-org/gitlab-ce) and [GitLab 
Mattermost](https://about.gitlab.com/2015/08/18/gitlab-loves-mattermost/)

## Usage
Install
[Vagrant](https://www.vagrantup.com/downloads.html) and ensure you have a
working
[Vagrant provider](https://docs.vagrantup.com/v2/getting-started/providers.html)
such as [VirtualBox](https://www.virtualbox.org/). Then run the following
commands:

````bash
# Install recommended plugins (if you want them):
#   vagrant-cachier will cache the Linux packages locally for later use
vagrant plugin install vagrant-cachier
#   vagrant-hostmanager will allow you to resolve the VM hostname ("pulp.box")
#   from your computer
vagrant plugin install vagrant-hostmanager
 
# Clone repo:
git clone https://github.com/liger1978/vagrant-gitlab.git

# Start and provision the Vagrant environment:
cd vagrant-pulp
vagrant up
````

You should be now be able to access your GitLab CE installation from your web
browser at http://gitlab.box with the following default credentials:

````
root
5iveL!fe
````

You should also be able to access GitLab Mattermost at http://mattermost.box