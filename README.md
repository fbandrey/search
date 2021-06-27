# README

## Setup on localhost

1. Clone the repo and copy [.env.example](https://github.com/fbandrey/search/blob/master/.env.example) to `.env` file.

2. Next simply run the command and wait once containers are up and running:

```bash
docker compose up --build
```

3. Later run the migrations in another terminal window:

```bash
docker compose run rails rails db:migrate
```

4. Run rake task to parse and save the list of procedures:

```bash
docker compose run rails rails procedures:sync
```

5. You are ready to use the app: http://localhost:1234

## Run tests

There is a separate compose file [rspec.yml](https://github.com/fbandrey/search/blob/master/rspec.yml) for RSpec. So to run the tests just do:

```bash
docker compose -f rspec.yml run rspec-app rspec
```

Clean up everything tests-related after that:

```bash
docker compose -f rspec.yml down
```

## Demo app

https://test-search.fbandrey.com

The app is running inside Kubernetes cluster, please find some more notes below.
## Some notes

* [procedures.rake](https://github.com/fbandrey/search/blob/master/lib/tasks/procedures.rake) – rake task to parse and save procedures;
* [procedures_controller.rb](https://github.com/fbandrey/search/blob/master/app/controllers/api/procedures_controller.rb) – endpoint controller;
* [procedures_controller_spec.rb](https://github.com/fbandrey/search/blob/master/spec/controllers/api/procedures_controller_spec.rb) – spec for controller;
* [search_app.vue](https://github.com/fbandrey/search/blob/master/app/javascript/front/search_app.vue) – small VueJS app to handle the frontend actions;
* [dev.Dockerfile](https://github.com/fbandrey/search/blob/master/dev.Dockerfile) – Dockerfile for development;
* [prod.Dockerfile](https://github.com/fbandrey/search/blob/master/prod.Dockerfile) – Dockerfile for production;
* [build-and-push.yml](https://github.com/fbandrey/search/blob/master/.github/workflows/build-and-push.yml) – Github action to build Docker image for production and push to the private registry;
* [k8s](https://github.com/fbandrey/search/tree/main/k8s) – Kubernetes config files.
