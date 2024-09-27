<table>
<tr>
<td><img src="https://www.pngall.com/wp-content/uploads/8/Red-Warning-PNG-Free-Download.png" width="100"></td>
<td align="center" bgcolor="#FFFF00">

# WARNING

**The software this image is for no longer works on the latest versions<br>
of Minecraft Bedrock Edition. This notice will be updated when there is a working version out.**

</td>
<td><img src="https://www.pngall.com/wp-content/uploads/8/Red-Warning-PNG-Free-Download.png" width="100"></td>
</tr>
</table>

# ![image](https://github.com/Androecia/FriendConnect-Docker/assets/59907407/99380263-9666-4e5d-9b1f-4fdc4f3b3036)FriendConnect-Docker | [Discord](https://discord.gg/gpQsX2UVQ7)
Run FriendConnect through Podman or Docker

# Table of Contents
- [FriendConnect-Docker](#friendconnect-docker--discord)
    - [FAQ](#faq)
- [Get Started](#get-started)
  - [Dependencies](#dependencies)
  - [Podman Installation (recommended)](#podman-installation-recommended)
  - [Docker Installation](#docker-installation)

### FAQ
- Q: I see Podman is recommended over Docker. What if I already have Docker installed? Will Podman break anything?
- A: Don't worry, Podman is completely separate from Docker and can run alongside it without breaking anything. You absolutely can have both on your system.

## Get Started
### Dependencies
- You will need [Podman (Recommended)](https://podman.io/docs/installation#linux-distributions) or [Docker](https://docs.docker.com/engine/install/) installed. Click on whichever you want, then go to your distribution's instructions.
- You will also need podman-compose for Podman or docker-compose for Docker (included in the Docker Engine installation)
- You can install podman-compose with pip
```python
pip install podman-compose
```

### Podman Installation (recommended)
- Create a folder for this service and go into the directory
```bash
mkdir ~/FriendConnect && cd ~/FriendConnect
```
- Download the Dockerfile and podman-compose.yml file from this repository
```bash
wget https://raw.githubusercontent.com/Androecia/FriendConnect-Container/main/{Dockerfile,podman-compose.yml}
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

### Docker Installation
- Create a folder for this service and go into the directory
```bash
mkdir ~/FriendConnect && cd ~/FriendConnect
```
- Download the Dockerfile and docker-compose.yml file from this repository
```bash
wget https://raw.githubusercontent.com/Androecia/FriendConnect-Container/main/{Dockerfile,docker-compose.yml}
```
- Configure the env variables you want, such as adding an xbox account, pointing the IP and Port to your server, etc.
- Start the service
```bash
docker compose up -d
```
- Link your xbox account
```bash
docker compose logs
```
You're done! Join the [Community Discord Server](<https://discord.gg/gpQsX2UVQ7>) if you have any questions.
