# Installation and development

## Ruby

Needs Ruby 2.4.4.

## System dependencies

```
# ExecJS runtime
$ sudo apt-get install nodejs

# PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged
$ sudo apt-get install cmake pkg-config

# deploys trigger a webhook
$ sudo apt-get install curl

# Cryptgraphy library (for deployment only)
$ sudo apt-get install libsodium-dev
```

## Application setup

Assuming your user is able to create databases, for example by running

```
$ sudo -u postgres createuser --superuser $USER
```

just execute

```
$ bin/setup
```

## Developing locally

To populate an empty database:

```
bin/rails runner Repo.sync
```

If you modify the name mappings, hard-coded authors, etc., that task also
updates the credits and it does so changing as little as possible.

Sometimes you may need to rebuild the assignments, for example if the actual
heuristics change. To do that please execute

```
bin/rails runner "Repo.sync(rebuild_all: true)"
```

## Test suite

To run the test suite execute

```
$ bin/rails test
```

Recent tests may need an up to date checkout of Rails. To do so:

```
$ cd rails.git
$ git fetch
```
