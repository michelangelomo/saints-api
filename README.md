# Saints

Saints As A Service

## Up and running

```bash
docker build -t saints .
docker run -p 8080:8080 -it -d saints
```

## Endpoints

- `/today`: saints of the day

- `/random`: one random saint
