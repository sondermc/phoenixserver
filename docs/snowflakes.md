# Snowflake
Using docker-compose (podman-compose) to up four instances which emulate snowflakes in a flat emulated flat network.

# Build
```bash
(cd ./snowflakes ; podman build -t snowflakes_baseimage --squash . )
```
# Run
```bash
(cd ./snowflakes ; podman-compose up -d)
```

# Kill all containers
Getting rid of snowflake servers, gives man the courage to erase any history. I love to start with a rigourous clean slate.

```bash
(cd ./snowflakes ; podman-compose down )
for i in $(podman ps --external  --format={{.ID}}); do podman stop ${i}; podman rm ${i}; done
podman system reset -f
```
