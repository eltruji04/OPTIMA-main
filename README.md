# OPTIMA

OPTIMA is a web-based platform designed to streamline Maintenance, Repair, and Operations (MRO) in the aerospace industry. It enables efficient tracking and management of aircraft and their associated components, including maintenance schedules, part inventories, and operational statuses.

🌟 OPTIMA: Simplifying aerospace fleet management for greater efficiency.

## Installation

Install OPTIMA
   
   Clone the repository and install the required dependencies using the following command:
   ```bash
   git clone --recurse-submodules https://github.com/eltruji04/OPTIMA-main
```



Then open the project with VSCode and type these commands in the VSCode console:
   ```bash
    git submodule init
    git submodule update
```

Update the submodule with this series of codes:
   ```bash
cd submodules/OPTIMA/
git submodule update --init --recursive
git stash push --include-untracked
git pull origin master
git stash pop
cd ../..
```

Then run the program by writing the following code
   ```bash
scripts/run_app.sh
```
## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`SECRET_KEY`


## Documentation

[Documentation](#)


## Screenshots

![App Screenshot](https://github.com/user-attachments/assets/04828215-8b07-4359-bd73-292b0235060d)

![App Screenshot](https://github.com/user-attachments/assets/7f62920c-7dda-4321-8d41-3b734289907e)


## License

[Apache-2.0](https://www.apache.org/licenses/)


## Features

- Light/dark mode toggle
- Live previews
- Fullscreen mode
- Cross platform


## Roadmap

- Maintenance Management

- Smart Inventory

- Documentation Management

## Feedback

If you have any feedback, please reach out to us at optima.aerospace@gmail.com



## Authors

- [@eltruji04](https://github.com/eltruji04)

- [@ShawiR0gers](https://github.com/ShawiR0gers)

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

