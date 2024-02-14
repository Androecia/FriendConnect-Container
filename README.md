# ![image](https://github.com/Androecia/FriendConnect-Docker/assets/59907407/99380263-9666-4e5d-9b1f-4fdc4f3b3036)FriendConnect-Docker | [Discord](https://discord.gg/gpQsX2UVQ7)
Run FriendConnect through Docker or Podman ``(If using podman, substitute podman-compose where you see docker compose)``

# WARNING
The image used in this latest release is bugged. Use the files from the version before this until we've looked into it: https://github.com/Androecia/FriendConnect-Docker/tree/6243fdf7d774d238e7a69cfa174dd2938fd61ae9

## Get Started
### Dependencies
- You will need [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/docs/installation#linux-distributions) installed. Click on whichever you want, then go to your distribution's instructions.

### FriendConnect-Docker Instructions
- Download
  ```bash
  git clone https://github.com/Androecia/FriendConnect-Docker.git
  mv FriendConnect-Docker FriendConnect
  cd FriendConnect
  ```
- Configure
  ```bash
  nano config/index.js
  ```
  - If you're new to the nano text editor:
    - Save: Control+S
    - Close: Control+X
- Start
  ```bash
  docker compose up -d
  ```
  - Wait for it to finish, then
  ```bash
  docker compose logs
  ```
  - Copy the code, click on the link, sign in and enter the code
 
  - The following error is expected and can be safely ignored:
    ```js
    friendconnect-friendconnect-1  | [FriendConnect ] Server Advertisement Error
    friendconnect-friendconnect-1  | Error Name:  TypeError
    friendconnect-friendconnect-1  | Error Message:  Wrong arguments
    friendconnect-friendconnect-1  | Error Stack:  TypeError: Wrong arguments
    friendconnect-friendconnect-1  |     at new Client (/FriendConnect/node_modules/raknet-native/lib/RakNet.js:8:19)
    friendconnect-friendconnect-1  |     at new RakNativeClient (/FriendConnect/node_modules/bedrock-protocol/src/rak.js:45:19)
    friendconnect-friendconnect-1  |     at ping (/FriendConnect/node_modules/bedrock-protocol/src/createClient.js:87:15)
    friendconnect-friendconnect-1  |     at Session.getAdvertisement (file:///FriendConnect/node_modules/friend-connect/dist/index.js:419:30)
    friendconnect-friendconnect-1  |     at new Session (file:///FriendConnect/node_modules/friend-connect/dist/index.js:76:14)
    friendconnect-friendconnect-1  |     at file:///FriendConnect/index.js:3:1
    friendconnect-friendconnect-1  |     at ModuleJob.run (node:internal/modules/esm/module_job:194:25)
    ```
  - Avoid a known bug by making your container restart every 2 hours
      - ```bash
        crontab -e
        ```
        - You can close this with Control+X, that was just to verify you had crontab installed. If not, the package name may be cron, crontab, or cronnie. Install it, test that you can open it, and then move on to the next instructions
      - Add an entry in your crontab to restart the stack every 2 hours
        - Docker
          ```cron
          (crontab -l 2>/dev/null; echo "0 */2 * * * $(which docker) compose -f $(pwd)/FriendConnect/docker-compose.yml restart") | crontab -
          ```
        - Podman
          ```cron
          (crontab -l 2>/dev/null; echo "0 */2 * * * $(which podman-compose) -f $(pwd)/FriendConnect/docker-compose.yml restart") | crontab -
          ```

### You're done! Here's some basics for managing your stack!
- Make a note of where you set this up. You'll want to ``cd directory`` where the directory is the path ending with the FriendConnect folder. The command below will tell you your current directory, so if you're still in the FriendConnect folder, write this down.
  ```bash
  pwd
  ```
- Great! You've been running this for a while and something went wrong somewhere. Time to troubleshoot. First, cd into your FriendConnect folder.
- Check the status of the stack
  ```bash
  docker compose ps
  ```
  - Is it down? Does it say it just started a second or a few seconds ago? Maybe it's stuck in a restart loop where it crashes and is restarted automatically. You probably want to stop it and troubleshoot.
    ```bash
    docker compose down
    ```
- Check the logs
  ```bash
  docker compose logs
  ```
- Try going into your docker-compose.yml file and setting FRIEND_CONNECT_DEBUG to ``true``
  ```bash
  nano docker-compose.yml
  ```
  - Now that you've told it to give you more information, start the stack again
    ```bash
    docker compose up -d
    ```
    - Now that you have more information, ie. a clear error message, head into the [FriendConnect Discord](https://discord.gg/gpQsX2UVQ7) for support. Remember to be clear about what your issue is, include the logs, and tell us what you've already tried.
