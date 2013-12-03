## Requirement
* install ansible
* have root ssh access for all hosts

## Usage
```ansible-playbook _playbookname_.yml -i hosts -K```

## Playbooks
* dev: install tools for development
* prod_eval: install Scala Insight service
* prod_webapp: install Web service