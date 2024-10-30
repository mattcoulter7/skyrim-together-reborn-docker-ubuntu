# SkyrimTogetherReborn Ubuntu Docker Server

<img src="https://github.com/user-attachments/assets/960c2c69-7f3b-43cf-8d23-23a80dcf77dd" alt="skyrim together reborn + docker" width="500"/>

This project ports the SkyrimTogetherReborn Windows Server into a portable Ubuntu Docker container.

This removes the overhead of maintaining your server, as it can now full be managed through a command line over sh, instead of RDP into a Windows Server.

## Setup Instructions

### Clone the Repository
```bash
git clone https://github.com/mattcoulter7/skyrim-trb-docker-port
cd skyrim-trb-docker-port
```

### Build the Docker Image
Replace `STR_DOWNLOAD_URL` with your own ZIP file URL if desired. Ensure it contains `SkyrimTogetherServer.exe` in `./SkyrimTogetherReborn/`.
```bash
docker build -t skyrim-trb-server --build-arg STR_DOWNLOAD_URL=https://s3.ap-southeast-2.amazonaws.com/skyrim.matthewcoulter.dev-mods/Skyrim+Together+Reborn.zip .
```

### Run the Server
```bash
docker run -d --name skyrim-trb-server -p 10578:10578 skyrim-trb-server
```
With the container named `skyrim-trb-server`, here are the concise Docker commands for common server management tasks:

### View the Server Configuration
```bash
docker exec skyrim-trb-server cat SkyrimTogetherReborn/config/STServer.ini
```

### Edit the Server Configuration
To edit the server configuration:
```bash
docker exec -it skyrim-trb-server nano SkyrimTogetherReborn/config/STServer.ini
```
> **Note:** After editing the server configuration file, you will need to restart the server for changes to take effect.

### Restart the Server
```bash
docker restart skyrim-trb-server
```

### Stop the Server
```bash
docker stop skyrim-trb-server
```

### Start the Server
```bash
docker start skyrim-trb-server
```

### Stream Server Logs
To view real-time logs from the server:
```bash
docker logs -f skyrim-trb-server
```
