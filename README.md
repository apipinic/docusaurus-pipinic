
# Developer Platform

## Git Repository

You can find the source code and installation instructions at the following GitHub repository:

[GitHub Repository](https://github.com/apipinic/developer-platform)

## Installation Instructions

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/apipinic/developer-platform.git
   ```

2. **Navigate to the Project Directory**:
   ```sh
   cd developer-platform
   ```

3. **Build and Run the Docker Container**:
   ```sh
   docker build -t developer-platform .
   docker run -d --name developer-platform -p 3000:3000 developer-platform
   ```

4. **Access the Application**:
   Open your web browser and go to `http://localhost:3000`.

5. **Pull and Start the Container Directly**:
   If you prefer not to build the container manually, you can pull and start the container with the following commands:
   ```sh
   docker pull ghcr.io/apipinic/developer-platform:latest
   docker run -d --name developer-platform -p 3000:3000 ghcr.io/apipinic/developer-platform:latest
   ```
