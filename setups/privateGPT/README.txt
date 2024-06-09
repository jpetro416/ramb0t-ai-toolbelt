# Ramb0t AI Toolbelt Setup Script

This script automates the setup and installation of essential tools and dependencies for the Ramb0t AI Toolbelt, including `privateGPT`. Follow the instructions below to run the script and set up your development environment.

## Prerequisites

Ensure you have the following prerequisites installed on your system:

- A Debian-based Linux distribution (e.g., Ubuntu)
- Administrative (sudo) access

## Script Overview

The script performs the following steps:

1. **Update and upgrade the system**:
    - Updates the package list
    - Upgrades all installed packages to their latest versions

2. **Install essential packages**:
    - Installs development tools and libraries required for building and running the project

3. **Clone the privateGPT repository**:
    - Clones the `privateGPT` repository from GitHub

4. **Install and configure pyenv**:
    - Installs `pyenv` for managing multiple Python versions
    - Updates the PATH and initializes `pyenv`

5. **Install Python 3.11 using pyenv**:
    - Installs Python 3.11 and sets it as the global version

6. **Upgrade pip**:
    - Upgrades `pip` to the latest version

7. **Install Poetry**:
    - Installs Poetry for dependency management
    - Updates the PATH to include Poetry

8. **Verify Poetry installation**:
    - Verifies that Poetry was installed successfully

9. **Install project dependencies using Poetry**:
    - Installs the project dependencies specified in the `pyproject.toml` file with additional extras

10. **Optional: Install NVIDIA CUDA toolkit**:
    - Installs the NVIDIA CUDA toolkit if required for your project

11. **Verify CUDA installation**:
    - Verifies that CUDA was installed successfully

12. **Install llama-cpp-python with CUBLAS support**:
    - Installs the `llama-cpp-python` package with CUBLAS support

13. **Run project setup script**:
    - Runs the project setup script using Poetry

14. **Ingest data for the project**:
    - Ingests data into the project from specified directories

15. **Run the project**:
    - Runs the project

## Usage

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/ramb0t-ai-toolbelt.git
    cd ramb0t-ai-toolbelt
    ```

2. Make the setup script executable:
    ```bash
    chmod +x setup.sh
    ```

3. Run the setup script with your project name as an argument:
    ```bash
    ./setup.sh <project_name>
    ```

    Replace `<project_name>` with the name of your project (e.g., `shufflebuy`).

## Contributing

If you would like to contribute to this project, please open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
