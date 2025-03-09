#!/usr/bin/env bash
# This script sets up and runs a Python virtual environment for a project.
# It checks if the virtual environment already exists and updates dependencies only if necessary.

# Script configuration options:
# -e: Stops the script if an error occurs.
# -u: Prevents the use of undefined variables.
# -o pipefail: Ensures that errors in a pipeline are properly detected.
set -euo pipefail

# Name of the directory where the virtual environment will be stored
VENV_DIR="venv"

# Path to the requirements file
REQUIREMENTS_FILE="requirements.txt"

# Step 1: Check if the virtual environment already exists
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Creating the virtual environment..."
    # Create the virtual environment using Python's `venv` module
    python3 -m venv "$VENV_DIR"
else
    echo "The virtual environment already exists. No need to recreate it."
fi

# Step 2: Activate the virtual environment
# This ensures that the `pip` and `python` commands use the virtual environment.
source "$VENV_DIR/bin/activate"

# Step 3: Ensure `pip` is up to date
# Updating `pip` ensures that the latest versions of tools and packages are used.
pip install -U pip

# Step 4: Install or update dependencies from requirements.txt
if [[ -f "$REQUIREMENTS_FILE" ]]; then
    echo "Installing dependencies from $REQUIREMENTS_FILE..."
    pip install -r "$REQUIREMENTS_FILE"
else
    echo "No $REQUIREMENTS_FILE found. Skipping dependency installation."
fi

# Step 5: Install or update OPTIMA
# This step checks if OPTIMA is already installed or if the `setup.py` file has changed.
# If changes are detected, the dependency is reinstalled; otherwise, it is skipped.
if [[ ! -f "$VENV_DIR/optima_installed.txt" || "$VENV_DIR/optima_installed.txt" -ot ./submodules/OPTIMA/setup.py ]]; then
    echo "Installing/updating OPTIMA..."
    # Install OPTIMA in editable mode (`-e`), allowing changes to the source code without reinstalling.
    pip install -U -e ./submodules/OPTIMA
    # Create or update the marker file to track the installation
    touch "$VENV_DIR/optima_installed.txt"
else
    echo "OPTIMA is already installed and up to date."
fi

# Step 6: Run the application
# This step starts the project's main application.
python3 app.py