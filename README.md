### Backend / Docker scripts

The backed services are configured in the `docker-compose.yml` file. These services are controlled via some convenience scripts in `./bin/docker`

- Choose the version of PostgreSQL you want to use by copying the relevant config file:

```
# For Postgres 12:
cp docker-compose-pg-12.yml docker-compose.yml
```

- `./bin/up` -> Install docker images and start the services.
- `./bin/stop` -> Stop all the services.
- `./bin/watch` -> Monitor all services in real-time.
- `./bin/teardown` -> Remove all docker containers and images.

### Setup

- Start all the docker services.
- Run the provided setup script:
```
./bin/setup
```
- Seed the database:
```
rake development:truncate_and_seed
```
- Start the app:
```
foreman start
```

### Configuration

- You can override environment settings in the `.env` file.

### Run the application

- Start the application:
```
foreman start
```
- Navigate to [http://localhost:3000](http://localhost:3000)
- Login using the default user credentials:
  - Email: `user1@devbox.co`
  - Password: `devbox123`

### Resetting data

- Run the provided rake task to prepare a clean dataset:
```
rake development:truncate_and_seed
```
### Add yarn

-For bootstrap install the yarn:
```
yarn add bootstrap
```

### Install Webpacker

-Run the following to install Webpacker:
```
bundle
bundle exec rails webpacker:install

# OR (on rails version < 5.0)
bundle exec rake webpacker:install
```
-Optional: To fix "unmet peer dependency" warnings:
```
yarn upgrade
```
When package.json and/or yarn.lock changes, such as when pulling down changes to your local environment in a team settings, be sure to keep your NPM packages up-to-date:
```
yarn install
```


### Running tests

- To run the test suite simply run:
```
rspec
```
- You can also run guard for TDD-style testing:
```
guard
```


