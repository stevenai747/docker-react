# Specific Base Image
FROM node:alpine as builder

# Working Directory in the container
WORKDIR '/app2'

# Copy package.json file
COPY package.json .
RUN npm install

# Copy other file
COPY . .
# Build
RUN npm run build

# Use the nginx image
FROM nginx
EXPOSE 80

# Copy from the previos step
COPY --from=builder /app2/build /usr/share/nginx/html
