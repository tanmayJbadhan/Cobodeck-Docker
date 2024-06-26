# Steps the built the entire container again


- Clone the repository
- Built the docker image
- ```cmd
  docker build -t
- Initialize the linux and ros environment in the browser by running the docker file
- ```cmd
  docker run -it --rm -p 6080:80 replace_with_containerid
- In the browser go to http://localhost:6080/ and you will see an entire linux GUI running inside the browser
![Screenshot](Screenshot%20from%202024-03-26%2009-24-45.png)


- To built dependencies follow the steps from the repo https://gitlab.tuwien.ac.at/e193-03-virtual-and-augmented-reality/cobodeck/mrvr-automation
- Once all the dependencies have been built clone the repo in the host machine https://gitlab.tuwien.ac.at/e193-03-virtual-and-augmented-reality/cobodeck/mrvr-main
- Also clone the this repo in your working directory https://github.com/smortezapoor/mrvr-lib-registry/tree/master again by clonning into host machine and then moving it into the virtual environment
- To clone and move the repo from host mahcine to virtual container, a volume from host machine needs to be linked to the container
- ```cmd
  docker run -it --rm -p 6080:80 -v 'replace with volme location' 'replace with container id'
- There are some dependency issues while builting the workspace but they can be solved by clonning the repos and editing the cmake file in some packages.
- After succesfully building the workspace using catkin built, source the devel setup in the browser
- ![Screenshot](Screenshot%20from%202024-03-26%2009-37-57.png)
- Now you should be able to see the simulation running
- ![Screenshot](Screenshot%20from%202024-03-26%2009-44-58.png)
- ![Screenshot](Screenshot%20from%202024-03-26%2009-45-11.png)
- ![Screenshot](Screenshot%20from%202024-03-26%2009-45-25.png)

    
## Alternatively you can use the .tar file for the image to setup the simulation right away

- Download the .tar file form the link https://drive.google.com/file/d/1jEWj-kCp196qbIYPZMZF_PEvaZU0MyTq/view?usp=drive_link
- Import the docker image
- ```cmd
  docker import /path/to/file.tar your_image_name:tag
- Run docker images if the container has succesfully been imported, if you see the container run it using the following command
- ```cmd
    docker run -it --rm -p 6080:80 -v 'replace with volme location' 'replace with container id'


