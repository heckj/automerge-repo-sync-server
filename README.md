# Automerge Repo Sync Server

A very simple automerge-repo synchronization server. It pairs with the
websocket client protocol found in
`@automerge/automerge-repo-network-websocket`.

The server is an unsecured [Express](https://expressjs.com/) app. It is partly
for demonstration purposes but it's also a reasonable way to run a public sync
server.

## Running the sync server

`npx @automerge/automerge-repo-sync-server`

The server is configured with environment variables. There are two options:

- `PORT` - the port to listen for websocket connections on
- `DATA_DIR` - the directory to store saved documents in

## Contributors

Originally written by @pvh.

## Docker

build it:

```bash
docker build -t automerge-repo-sync-server .
```

run it:

```bash
docker run -d automerge-repo-sync-server
```
