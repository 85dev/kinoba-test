# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## :bulb: Setup

### Ruby setup

Run following command at the root of the project

```shell
bundle install
bin/rails db:create db:migrate db:seed
```

### Vue3 setup

Run following command in the folder `@latest`

```
npm install
```

## Environment setup

Fill in the environment variables in `.env` and `@latest/.env`.

`VITE_API_URL` => `http://localhost:3000`
`VITE_IMAGE_URL` => `https://image.tmdb.org/t/p/w500`

## :hammer: Run

### Start rails app

```shell
rails s
```

### Start vue app

```shell
npm run build
npm run dev
```
