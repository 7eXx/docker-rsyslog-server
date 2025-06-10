# Docker Rsyslog Server
This project provides a Docker container for running an Rsyslog server.  
It is designed to be simple to set up and use, allowing you to collect and manage logs from various sources.

## Building the Docker Image
To build the Docker image, run the following command in the root directory of the project:

```bash
docker build -t rsyslog-server .
```
## Running the Docker Container
To run the Docker container, use the following command:

```bash
docker run -d --name rsyslog-server -p 514:514/udp -p 514:514/tcp rsyslog-server
```
## Configuration
The Rsyslog server can be configured by modifying the `rsyslog.conf` file located in the `conf` directory.
You can mount a custom configuration file by using the `-v` option when running the container:

```bash
docker run -d --name rsyslog-server -p 514:514/udp -p 514:514/tcp -v /path/to/your/rsyslog.conf:/etc/rsyslog.conf rsyslog-server
```
## Accessing Logs
Logs can be accessed from the `/var/log/` directory inside the container. You can mount a host directory to persist logs:

```bash
docker run -d --name rsyslog-server -p 514:514/udp -p 514:514/tcp -v /path/to/logs:/var/log rsyslog-server
```
