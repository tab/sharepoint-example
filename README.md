# Sharepoint example

Build docker container with compose:

```sh
docker-compose build
docker-compose up
```

Access to the container:

```sh
docker-compose exec sharepoint-example sh
```

Generate a sample file:

```sh
/app # ruby sample.rb
```

Upload the file to Sharepoint:

```sh
/app # ruby upload.rb
```
