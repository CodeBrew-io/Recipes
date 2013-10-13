## Usage
### Dev
```ansible-playbook dev.yml -i hosts -K```

### Prod
#### Google Cloud Platform
* create vm Instance https://cloud.google.com/console
* ```gcutil --service_version="v1beta15" --project="Project ID" ssh --zone="us-central1-a" "Instance Name"
* ```ssh-agent```
* ```ssh-add ~/.ssh/google_compute_engine```
* ```ansible-playbook prod.yml -i hosts```