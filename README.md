# Surface Browser Web Interface

This is a simple site which allows the gallery visitor to queue up links (at <http://localhost:8080/>) for Surface Browser to consume at (<http://localhost:8080/link.phtml>)

## Docker Setup Prerequisites

- Docker
- Docker Compose

## Installation Steps

1. Check prerequisites and clone the repository
2. Copy `.env.example` to `.env`:
3. Edit `.env` to set secure passwords for:
   - MYSQL_ROOT_PASSWORD
   - MYSQL_PASSWORD
4. Optionally, set HOST_IP (see below for full .env info)
5. Build and start the containers:

   ```bash
   docker-compose up -d --build
   ```

6. The application will be available at: <http://localhost:8080>

## Configuration

- Web server runs on port 8080 (configurable in docker-compose.yml)
- MySQL database runs on port 3306 (configurable in docker-compose.yml)
- Database credentials should be configured in .env file

### Environment Variables (.env)

Copy `.env.sample` to `.env` and configure the following variables:

- `MYSQL_HOST`: Database host (default: db)
- `MYSQL_DATABASE`: Database name (default: surfacebrowser)
- `MYSQL_USER`: Database user (default: sb_user)
- `MYSQL_PASSWORD`: Password for the application database user
- `MYSQL_ROOT_PASSWORD`: Root password for MySQL database
- `HOST_IP`: The IP address to bind the web server to (default: 0.0.0.0)
- `ENABLE_AI_SEEDS`: Enable AI-generated content seeds

Example configurations for HOST_IP:

- only localhost: HOST_IP=127.0.0.1
- a specific network interface: HOST_IP=192.168.1.100
- all interfaces: HOST_IP=0.0.0.0

## Keyboard Shortcuts

The interface supports the following keyboard shortcuts:

- **Q + A + Y**: Press these keys simultaneously to clear the current queue of links

## Test Content Links

An endpoint `/test_content_link.phtml` is available for testing purposes. This endpoint serves predefined test URLs for each content point.

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
  
  Just web logs:
  
  ```bash
  docker-compose logs -f web
  ```
  
