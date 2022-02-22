# TypeDB on Fly 

<img src="https://avatars.githubusercontent.com/u/22525303?s=200&v=4" />

This repo can be used to deploy [TypeDB] on Fly. 
Fly allows easy deployment of servers with multiple regions, SSL and private networking and an awesome CLI!
The repo includes a Github Actions workflow for continuous deployment.

## Backups
- The docker runs a backup process alongside the TypeDB server. You can set the appropriate env variables to upload the backups to your cloud storage.

[TypeDB]: https://www.vaticle.com/
[Fly]: https://fly.io
