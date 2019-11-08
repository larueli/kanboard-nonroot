# Kanboard-nonroot

You will find here the build files used to build and run the [kanboard-nonroot docker image](https://hub.docker.com/repository/docker/larueli/kanboard-nonroot)

## Features

* Edit of the official kanboard image
* Works on OpenShift
* Exec with latest alpine, as non root user and on ports 8080 8443.

## How is it built ?

You can check the *scriptdeploy* file to see how the script builds the image :

1. clone the kanboard repository
2. edit the kanboard files (Dockerfile, conf files)
3. build the image from the Dockerfile
4. when you run the image, the *entrycheck* script is launched : creation of folders, of certificates if needed, launch of php-fpm and nginx as non root.

## More info about the image

You can go on the page of the [Docker Hub repository](https://hub.docker.com/repository/docker/larueli/kanboard-nonroot)

You can check the [official image](https://hub.docker.com/r/kanboard/kanboard).

# Author

I am [Ivann LARUELLE](https://www.linkedin.com/in/ilaruelle/), engineering student in Networks & Telecommunications at the [Université de Technologie de Troyes](https://www.utt.fr/) in France, which is a public engineering university.

This tool was made for the UTT Net Group, an non profit organization which aims to [provide IT Service](https://ung.utt.fr/tech/sia) to all UTT students and student organizations.

Contact me for any issue : ivann.laruelle[at]gmail.com

# Licence

You are free to download, use, modify, redistribute theses files. The only thing is that you must credit me and keep the header of the files.
