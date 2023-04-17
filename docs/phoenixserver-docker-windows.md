# Phoenix server
This is a lightweight alpine image using the playbook in the ./abp directory and connecting to the emulated flat network. The inventory file is aligned with the snowflake servers.


# Build
```bash
cd ./phoenixserver ; docker build -t phoenixserver . ; cd ..
```

# Run
```bash
docker run -ti --mount type=bind,source="${PWD}/apb",target=/apb --network=snowflakes_snowflakes phoenixserver
```
