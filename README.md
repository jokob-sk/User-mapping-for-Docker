# User-mapping-for-Docker

Example `docker-compose.yaml`

```yaml
version: "3"
services:
  debian:
    build: .     
    network_mode: "host"        
    restart: always
    environment:      
      - USER_ID=1029 #Specify your host User ID here
    command: tail -f /dev/null
```


