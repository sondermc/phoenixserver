# Phoenix server
This is a lightweight alpine image using the playbook in the ./abp directory and connecting to the emulated flat network. The inventory file is aligned with the snowflake servers.


# Build
```bash
(cd ./phoenixserver ; podman build -t phoenixserver .)
```

# Run
```bash
podman run -ti \
  -v $(pwd)/apb:/apb:Z \
  --userns=keep-id \
  --network=snowflakes_snowflakes \
  phoenixserver
```
