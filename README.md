# Docker Ubuntu SSH

This repository provides a Docker setup for running an Ubuntu container with SSH access.

## Prerequisites

- Docker installed on your machine. You can download Docker from [here](https://docs.docker.com/get-docker/).

## Installation

### 1. Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/samocodes/docker-ubuntu-ssh.git
cd docker-ubuntu-ssh
```

### 2. Build the Docker Image

Build the Docker image using the `docker build` command. You can specify the username and password for SSH access using build arguments:

```bash
docker build --build-arg username=samir --build-arg password=password -t ubuntu-ssh .
```

### 3. Run the Docker Container

Create and run a container from the image:

```bash
docker run -d -p 2222:22 --name ubuntu-ssh-container ubuntu-ssh
```

This will run the container in detached mode and map port 2222 on your host to port 22 in the container for SSH access.

### 4. SSH into the Container

You can now SSH into the container using the username and password you specified during the build:

```bash
ssh samir@localhost -p 2222
```

## Customization

You can modify the Dockerfile to customize the Ubuntu setup, install additional packages, or configure SSH settings.

## Troubleshooting

- Ensure that Docker is running on your machine.
- Verify that the container is running with `docker ps`.
- Check the container logs for any errors using `docker logs ubuntu-ssh-container`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License.
