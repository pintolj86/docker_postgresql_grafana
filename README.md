# Docker Simple set up for postgresql and grafana.
## Simple usage:
Clone or download the docker-compose.yml file and adjust to your personal settings.

## Postgresql Service:
environment:
      - POSTGRES_USER= <username_here>
      - POSTGRES_PASSWORD= <password_here>
    volumes:
      - data:/var/lib/postgresql/data
      - ./schema.sql:/docker-entrypoint-initdb.d/schema.sql
Also is possible to setup the postgresql.conf adding another volume in environment:
- ./postgres.conf:/etc/postgresql/postgresql.conf

command: postgres -c config_file=/etc/postgresql/postgresql.conf

## Grafana Service:
user: "$UID:$GID" it's necessary to add the user.

More info about Grafana config:
https://grafana.com/grafana/dashboards/893

## Volumes Declaration
data: {}
schema.sql: {}
grafana: {}

More info about volumes:
https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
