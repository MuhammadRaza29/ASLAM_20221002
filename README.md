# README

## Project setup with docker

### Build docker containers
```
docker-compose up --build
```

### Start all docker containers
```
docker-compose up
```

### Database creation
```
docker-compose exec web-app bundle exec rails db:setup
```

### Run Seeds
```
docker-compose exec web-app bundle exec rails db:seed
```
### Run Database Migration
```
docker-compose exec web-app bundle exec rails db:migrate
```

### Start rails console
```
docker-compose exec web-app bundle exec rails c
```

### Run Rspec
```
docker-compose exec web-app bundle exec rspec
```



## Project setup without docker

### Database creation
```
rails db:setup
```
### Run Seeds
```
rails db:seed
```
### Run Database Migration
```
rails db:migrate
```
### Start server
```
rails s
```

```
### Run webpacker
```
yarn start:dev
```

### Start rails console
```
rails c
```
### Run Rspec
```
rspec
```
