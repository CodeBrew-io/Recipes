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

#### Info
serveur3.lerb.polymtl.ca => 2x Xeon(2.66GHz) 		+ 2GB Ram 	(virtual)
l4817-0X.lerb.polymtl.ca => 4x i5-3570(3.4GHz) 		+ 16GB Ram 	(physical)
google (high-cpu-2)		 => 2x						+ 2GM Ram	(virtual)