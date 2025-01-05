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
4. Optionally, set HOST_IP (see below)
5. Build and start the containers:

   ```bash
   docker-compose up -d --build
   ```

6. The application will be available at: <http://localhost:8080>

## Configuration

- Web server runs on port 8080 (configurable in docker-compose.yml)
- MySQL database runs on port 3306 (configurable in docker-compose.yml)
- Database credentials should be configured in .env file
- HOST_IP: The IP address to bind the web server to (default: 0.0.0.0)
Example configurations to make it accessible on:
  - only localhost: HOST_IP=127.0.0.1
  - a specific network interface: HOST_IP=192.168.1.100
  - all interfaces: HOST_IP=0.0.0.0

## Keyboard Shortcuts

The interface supports the following keyboard shortcuts:

- **Q + A + Y**: Press these keys simultaneously to clear the current queue of links

## Test Content Links

A special endpoint `/test_content_link.phtml` is available for testing purposes. This endpoint serves predefined test URLs that are stored in the database with the following types:

- TYPE_TEST_URL (5): Basic web URLs
- TYPE_TEST_IMAGE (6): Image-focused content
- TYPE_TEST_AI (7): AI-generated or AI-related content

These test links are kept separate from the regular browsing content and are only accessible through this specific endpoint.

To access: [Server path]/test_content_link.phtml

Note: Test content links are not accessible through the regular `/link.phtml` endpoint, which continues to serve only browser food content and user-added seeds.

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
  
