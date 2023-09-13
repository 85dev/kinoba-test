# README

## Prerequisites

- Ruby 3.1.1
- Postgresql
- Nodejs

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

Fill in the environment variables in `.env` for API setup and `@latest/.env` for front-end setup.

# API setup .env

`TMDB_API_URL=https://api.themoviedb.org/3`
`TMDB_API_TOKEN=*** YOUR_API_TOKEN ***`

# FRONT-END setup @latest/.env

`VITE_API_URL` => `http://localhost:3000`\
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
