# Use a lightweight Linux image
FROM ubuntu:20.04

# Set environment variable to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install i386 architecture support (required by Wine)
RUN dpkg --add-architecture i386

# Update the package manager cache
RUN apt-get update

# Install Wine64 in its own step
RUN apt-get install -y wine64

# Install Wine32 in its own step
RUN apt-get install -y wine32

# Install unzip in its own step
RUN apt-get install -y unzip

# Install wget in its own step
RUN apt-get install -y wget

# Set the build argument for the zip file download link and SkyrimTogetherServer.exe path
ARG ZIP_URL
ARG SKYRIM_TOGETHER_SERVER_PATH

# Create a working directory
WORKDIR /app

# Download the ZIP file
RUN wget -O server.zip ${ZIP_URL}

# Extract the ZIP file
RUN unzip server.zip -d /app && rm server.zip

# Set the working directory to the SkyrimTogetherServer.exe folder
WORKDIR ${SKYRIM_TOGETHER_SERVER_PATH}

# Expose the default Skyrim Together server port
EXPOSE 10578

# Run the Skyrim Together server using Wine
CMD ["wine", "SkyrimTogetherServer.exe"]
