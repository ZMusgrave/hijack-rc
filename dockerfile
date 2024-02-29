# Use the official Node.js 16 image as a parent image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Install pnpm instead of npm
RUN npm install -g pnpm

# Copy the package.json and package-lock.json (or yarn.lock) files
COPY package.json ./
COPY pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of your app's source code
COPY . .

# Build the TypeScript project (if you have a build script in package.json)
RUN pnpm build

# Expose the port your app runs on
EXPOSE 3000

# Command to run your app
CMD ["pnpm", "start"]
