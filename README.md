# TypeDB on Fly 

<img src="https://avatars.githubusercontent.com/u/22525303?s=200&v=4" />

This repo can be used to deploy [TypeDB] on [Fly]. 
## Features
- Backups to S3-compatible object storage
- Tailscale support for tunneling
- Continuous deployment via Github Actions


## Usage
The docker runs a backup process alongside the TypeDB server using [overmind](https://github.com/darthSim/overmind) and [go-cron](https://github.com/odise/go-cron).
You can set the appropriate env variables in the `fly.toml` to upload the backups to your cloud storage.


[TypeDB]: https://www.vaticle.com/
[Fly]: https://fly.io
