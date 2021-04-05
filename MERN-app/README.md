# Mern Todo-Apps with Docker

## Containers

* `client` with React on `https://localhost:3000` route
* `server` with Express on `https://localhost:5000` route
* `mongo` with MongoDB
* `adminmongo` with AdminMongo on `http://localhost:1234` route

Docker images available
* `client` >> [sekolahdevopscilsy/mern-docker_client](https://hub.docker.com/repository/docker/sekolahdevopscilsy/client)
* `server` >> [sekolahdevopscilsy/mern-docker_server](https://hub.docker.com/repository/docker/sekolahdevopscilsy/server)

## Usage

You can use `docker-compose up -d` command to deploy the container, or for every container separately, you can use `docker-compose up -d [container_name] client server adminmongo`

Get in to container and install more dependecies with `docker exec -it server /bin/sh` or `docker exec -it client /bin/sh` and then `npm install whatewer`.

Get logs from container to check everything is running correctly with `docker logs --tail 50 server` or `docker logs --tail 50 client`

Shut down containers with `docker-compose down`.

If you change `Dockerfile` rebuild container with `docker-compose build server`. Container names are `client`, `server`, `mongo` and `adminmongo`.

Access React app on `http://localhost:3000` and test the server on `https://localhost:5000/api/message`. Generate your own ssl keys and put them in `/security` folder if you like. Connection to the mongodb is in the `/config/dev.js`. Access adminmongo on `http://localhost:1234`.

## Preview
### Todos List View
![Todos List View](./screenshots/ViewToDo.PNG?raw=true "Todos List View")

### Create Todo
![Create Todo](./screenshots/createTodo.PNG?raw=true "Create Todo")

### Express Message
![Express Message](./screenshots/ExpressMessagePNG?raw=true "Edit Todo")

## Credits

CRUD Todo app repo is here [sdcilsy/mern-todo-app](https://github.com/sdcilsy/mern-todo-app), based on the tutorial below [The MERN Stack Tutorial — Building A React CRUD Application From Start To Finish](https://medium.com/codingthesmartway-com-blog/the-mern-stack-tutorial-building-a-react-crud-application-from-start-to-finish-part-1-d8d701c2995).

Docker tutorial is here [How to create a full stack React/Express/MongoDB app using Docker](https://medium.freecodecamp.org/create-a-fullstack-react-express-mongodb-app-using-docker-c3e3e21c4074).

Credit for this dockerized MERN stack [nemanjam/mern-docker](https://github.com/nemanjam/mern-docker)

## Additional notes

Tested on Linux Mint 20.1 / Ubuntu 20.04. 

For nodemon restart to work there is `-L` flag in `"server": "nodemon -L server.js"` in `package.json`. 

For create-react-app to live reload there is `CHOKIDAR_USEPOLLING=true` environment var in `docker-compose.yml`. 

For mongo volume to work in the Windows VirtualBox shared folder there is `volumes: mongodata:`. 

Note that `command` in the `docker-compose.yml` overrides the `CMD` in the `Dockerfile`.
