# Surface Browser Web Interface

This is a simple site which allows the gallery visitor to queue up links (at http://localhost:8080/ ) for Surface Browser to consume at ( http://localhost:8080/link.phtml )

## Docker Setup Prerequisites
- Docker
- Docker Compose

## Installation Steps

1. Clone the repository
2. Copy `.env.example` to `.env`:
3. Edit `.env` to set secure passwords for:
   - MYSQL_ROOT_PASSWORD
   - MYSQL_PASSWORD
4. Optionally, set HOST_IP (see below)
5. Build and start the containers:
   ```bash
   docker-compose up -d --build
   ```
6. The application will be available at: http://localhost:8080

## Configuration
- Web server runs on port 8080 (configurable in docker-compose.yml)
- MySQL database runs on port 3306 (configurable in docker-compose.yml)
- Database credentials should be configured in .env file
- HOST_IP: The IP address to bind the web server to (default: 0.0.0.0)
Example configurations to make it accessible on:
  - only localhost: HOST_IP=127.0.0.1
  - a specific network interface: HOST_IP=192.168.1.100
  - all interfaces: HOST_IP=0.0.0.0

## Stopping the Application
  ```bash
   docker-compose down
  ```

  To remove all data including the database volume:
  ```bash
   docker-compose down -v
  ```

  ## Accessing Logs
  ```bash
   docker-compose logs -f
  ```
