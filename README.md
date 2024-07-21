# ![image](https://github.com/Androecia/FriendConnect-Docker/assets/59907407/99380263-9666-4e5d-9b1f-4fdc4f3b3036)FriendConnect-Docker | [Discord](https://discord.gg/gpQsX2UVQ7)
Run FriendConnect through Podman or Docker

## Get Started
### Dependencies
- You will need [Podman (Recommended)](https://podman.io/docs/installation#linux-distributions) or [Docker](https://docs.docker.com/engine/install/) installed. Click on whichever you want, then go to your distribution's instructions.
- You will also need podman-compose for Podman or docker-compose for Docker (included in the Docker Engine installation)
- You can install podman-compose with pip
```python
pip install podman-compose
```

### FAQ
- Q: What if I already have Docker installed? Will Podman break anything?
- A: Don't worry, Podman is completely separate from Docker and can run alongside it without breaking anything. You absolutely can have both on your system.

### Podman Installation (recommended)
- Create a folder for this service and go into the directory
```bash
mkdir ~/FriendConnect && cd ~/FriendConnect
```
- Download the Dockerfile and podman-compose.yml file from this repository
```bash
wget https://raw.githubusercontent.com/Androecia/FriendConnect-Docker/main/{Dockerfile,podman-compose.yml}
```
- Configure the env variables you want, such as adding an xbox account, pointing the IP and Port to your server, etc.
- Start the service
```bash
podman-compose up -d
```
- Link your xbox account
```bash
podman-compose logs
```
You're done! Join the [Community Discord Server](<https://discord.gg/gpQsX2UVQ7>) if you have any questions.

### Docker Installation (WIP)
- Docker doesn't support permissions as well as Podman; you'd have to modify the /etc/docker/daemon.json file to do permissions correctly, which could screw up other containers if they do weird stuff with their permissions... I'll likely get around to testing this within a week.
