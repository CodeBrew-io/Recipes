## Usage
add your public key to $HOME/.ssh/authorized_key for each host in the inventory

```ansible-playbook users.yml -i hosts```

### Copy ssh keys
* create a ssh key with ```ssh-keygen``` on your computer
* run ```ansible-playbook -i hosts copyssh.yml -k``` to copy ssh keys over all computers 


## Todo
backend scala
* sbt
* intellij
* sublime

backend
* mongo ?

frontend
* bracket

deploiement
* nginx