# PX4 Humble Gazebo Docker SITL setup

TLDR: First run `build.sh`, then for the first time after startup `run.sh`.
For the next runs you can use `start.sh`.
While the container is running run the rest of the commands wither in it or
through docker exec (`docker exec -it px4 bash`).

`build.sh` will take about 10 mins to download based on internet speed.
Humble is installed, but not all required packages are mentioned (WIP).


To run the simulations once in the container
```
cd PX4-Autopilot
make px4_sitl gz_x500
```

# References
- (ubuntu.sh)[https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/ubuntu.sh]
    - script used to install alll dependancies, not needed to be run
    - Dockerfile contains all needed depends already
- (requirements.txt)[https://github.com/PX4/PX4-Autopilot/blob/main/Tools/setup/requirements.txt]
    - coppied into requirements.txt, run in Dockerfile
