# Snowflake
Using docker-compose (docker-compose) to up four instances which emulate snowflakes in a flat emulated flat network.

# Build
```powershell
cd ./snowflakes ; docker build -t snowflakes_baseimage . ; cd ..
```
# Run
```powershell
cd ./snowflakes ; docker-compose up -d; cd ..
```

# Kill all containers
Getting rid of snowflake servers, gives man the courage to erase any history. I love to start with a rigourous clean slate.

```powershell
cd ./snowflakes ; docker-compose down ; cd ..
for i in $(docker ps --external  --format={{.ID}}); do docker stop ${i}; docker rm ${i}; done
docker system reset -f
```
