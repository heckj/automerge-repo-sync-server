# syntax=docker/dockerfile:1.4
LABEL org.opencontainers.image.source=https://github.com/heckj/automerge-repo-sync-server
LABEL org.opencontainers.image.description="A debugging/test instance of automerge-repo-sync-server"
LABEL org.opencontainers.image.licenses=MIT

# https://docs.github.com/en/packages/managing-github-packages-using-github-actions-workflows/publishing-and-installing-a-package-with-github-actions

FROM node:lts-slim AS development
 
# Create app directory
WORKDIR /usr/src/app
 
COPY package.json ./package.json
RUN yarn install
 
COPY . .
 
EXPOSE 3030
# NODE_ENV=dev DEBUG=* node ./src/index.js
ENV NODE_ENV=dev
ENV DEBUG=*
CMD [ "node", "./src/index.js" ]
 
FROM development as dev-envs
RUN <<EOF
apt-get update
apt-get install -y --no-install-recommends git
EOF
 
RUN <<EOF
useradd -s /bin/bash -m vscode
groupadd docker
usermod -aG docker vscode
EOF
 
HEALTHCHECK CMD curl --fail http://localhost:3030 || exit 1  

# install Docker tools (cli, buildx, compose)
# COPY --from=gloursdocker/docker / /

CMD [ "node", "./src/index.js" ]
