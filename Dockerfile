# Use the official Windows Server Core image from Microsoft
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set the working directory to /app
WORKDIR /app

# Copy the necessary files into the container
COPY Downloads.bat show.bat time.py ./

# Download & install essentials (Downloads.bat)
RUN powershell -Command "Invoke-WebRequest -Uri 'https://gitlab.com/chamod12/win10-github-rdp-rustdesk/-/raw/main/Downloads.bat' -OutFile 'Downloads.bat'" && \
    cmd /c Downloads.bat

# Log in to RustDesk (show.bat)
RUN cmd /c show.bat

# Run the time counter (time.py)
RUN python time.py

# Cleanup unnecessary files if needed (optional)
RUN del Downloads.bat show.bat time.py

# Specify the command to run on container startup
CMD ["cmd"]
