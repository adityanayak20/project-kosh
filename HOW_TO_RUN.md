# Running Projekt Kosh with Docker (Instructions for Friend)

Here's how to get the Projekt Kosh wallet generator running on your machine using Docker after cloning it from GitHub.

## Prerequisites

*   **Install Git:** If you don't have it already, download and install Git from [https://git-scm.com/downloads](https://git-scm.com/downloads). You'll need this to clone the repository.
*   **Install Docker:** You need Docker Desktop (for Mac/Windows) or Docker Engine (for Linux) installed and running on your machine. Get it from [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/).

## Steps

1.  **Clone the Repository:**
    Open your terminal (Command Prompt, PowerShell, Terminal app) and run the following command to download the project code from GitHub:
    ```bash
    git clone https://github.com/adityanayak20/project-kosh.git
    ```

2.  **Navigate into the Project Directory:**
    Use the `cd` command to move into the folder that was just created by the clone command:
    ```bash
    cd project-kosh
    ```

3.  **Build and Run with Docker Compose (Recommended):**
    This is the easiest method if the project includes a `docker-compose.yml` file. While still inside the `project-kosh` directory in your terminal, run:
    ```bash
    docker compose up --build -d
    ```
    *   `--build`: This tells Docker Compose to build the Docker image using the `Dockerfile` found in the directory.
    *   `up`: This command starts the service(s) defined in the `docker-compose.yml` file.
    *   `-d`: This runs the container in "detached" mode, meaning it runs in the background, and your terminal prompt will become available again.
    *   *Note:* The first time you run this, Docker will need to download the base Node.js image and build the application, which might take a few minutes depending on your internet connection and computer speed. Subsequent runs will be much faster.

4.  **(Alternative) Build and Run with Docker Commands Directly:**
    If you prefer not to use Docker Compose, or if the project doesn't have a `docker-compose.yml` file, you can use these separate commands:
    *   **Build the Docker image:**
        ```bash
        docker build -t projekt-kosh .
        ```
        *(This command builds the image from the `Dockerfile` in the current directory and tags it with the name `projekt-kosh`)*.
    *   **Run the Docker container:**
        ```bash
        docker run -d -p 3000:3000 --name kosh-container projekt-kosh
        ```
        *(This command starts a container from the `projekt-kosh` image, runs it in detached mode (`-d`), maps port 3000 on your computer to port 3000 inside the container (`-p 3000:3000`), and gives the container the name `kosh-container`)*.

## Accessing the Application

Once the container is running (after the `docker compose up` or `docker run` command finishes), open your favorite web browser (like Chrome, Firefox, Safari, Edge) and navigate to the following address:

**`http://localhost:3000`**

You should now see the Projekt Kosh application interface loaded in your browser.

## Stopping the Application

When you are finished using the application, you can stop the Docker container:

*   **If you used Docker Compose:**
    Make sure you are in the `project-kosh` directory in your terminal and run:
    ```bash
    docker compose down
    ```
    *(This command stops and removes the containers defined in the compose file).*

*   **If you used direct Docker commands:**
    Run the following command to stop the container by its name:
    ```bash
    docker stop kosh-container
    ```
    *(Optional: If you want to remove the stopped container completely to clean up, you can run `docker rm kosh-container` after stopping it).*

---

Let me know if you run into any issues during these steps!
