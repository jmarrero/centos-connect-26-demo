# CentOS Connect 26 Demo

A demonstration of running containerized workloads on CentOS bootc using Quadlet.

## Overview

This demo consists of two container images:

1. **httpd container** - A simple Apache httpd server based on CentOS Stream 9 serving a static webpage
2. **bootc host image** - A CentOS Stream 10 bootable container image that runs the httpd container as a systemd service using Quadlet

## Project Structure

- `Containerfile` - Builds the httpd application container
- `host/Containerfile` - Builds the bootc host image
- `host/usr/share/containers/systemd/httpd.container` - Quadlet unit file for the httpd service
- `index.html` - Static webpage served by httpd
- `.github/workflows/build.yml` - CI workflow that builds and pushes images to ghcr.io

## Building

Build the httpd container:

```
podman build -t centos-connect-26-demo:latest .
```

Build the host image:

```
podman build -t centos-connect-26-demo-host:latest ./host
```

## Running

Run the httpd container standalone:

```
podman run -p 8080:80 centos-connect-26-demo:latest
```

Then visit http://localhost:8080
