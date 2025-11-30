FROM node:iron-trixie-slim

WORKDIR /site

COPY package*.json /site/

RUN npm install
RUN npm run build

# Copy the rest of the project

ENV HOST=0.0.0.0
ENV PORT=4321

# Expose the dev server port (adjust if needed)
EXPOSE 4321

# This setup doesn't yet work with VSCode dev containers. You still need to
# run "docker compose up" from the integrated terminal after opening this repo
# in VSCode. It also doesn't watch the changes (because they are in the
# container)

# Start the dev server
CMD ["npm", "run", "dev"]