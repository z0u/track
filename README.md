# Slack Variables

This app simplifies tracking of variables over time.


## Running a Server

First create the database schema:

```
sudo docker-compose run --rm alembic upgrade head
```

Then start the web server:

```
sudo docker-compose run --rm web
```

## Front-end Development


```
sudo docker-compose run --rm ionic serve --nobrowser
```
