# mtsmfm.github.io

## Requirements

- docker
- docker-compose
- docker-sync

## Setup

    docker-sync start
    docker-compose run app bundle install
    docker-compose up
    # open localhost:3000

## Deploy

    docker-compose run app bin/middleman deploy
