# Mini Wars [Under Development]

A Mini action game built using Flutter and Flame. Backend used Appwrite.
<p>
<a href="https://flutter.dev/" target="_blank" >
  <img style="width: 160px" src=".github\logos\builtwithFlutter.svg" alt="Built with Flutter">
</a>
<a>&nbsp;&nbsp;&nbsp;</a>
<a href="https://flame-engine.org/" target="_blank" >
  <img style="width: 160px;" src=".github\logos\flame.png" alt="Built with Flame">
</a>
<a>&nbsp;&nbsp;&nbsp;</a>
<!-- 'Made with Appwrite' badge -->
<a href="https://appwrite.io/" target="_blank" >
  <img style="width: 160px;" src="https://appwrite.io/images-ee/press/badge-pink-button.svg" alt="Built with Appwrite">
</a>
</p>

## What is Flame ?

Flame is a 2D game engine made on top of Flutter

## What is Appwrite?

[Appwrite](https://appwrite.io/) is a self-hosted solution that provides developers with a set of easy-to-use and integrate REST APIs to manage their core backend needs.

## Installation

### Appwrite

Appwrite backend server is designed to run in a container environment. Running your server is as easy as running one command from your terminal. You can either run Appwrite on your localhost using docker-compose or on any other container orchestration tool like Kubernetes, Docker Swarm or Rancher.

The easiest way to start running your Appwrite server is by running our docker-compose file. Before running the installation command make sure you have [Docker](https://www.docker.com/products/docker-desktop) installed on your machine:

### Unix

```bash
docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:0.13.4
```

### Windows

#### CMD

```cmd
docker run -it --rm ^
    --volume //var/run/docker.sock:/var/run/docker.sock ^
    --volume "%cd%"/appwrite:/usr/src/code/appwrite:rw ^
    --entrypoint="install" ^
    appwrite/appwrite:0.13.4
```

#### PowerShell

```powershell
docker run -it --rm ,
    --volume /var/run/docker.sock:/var/run/docker.sock ,
    --volume ${pwd}/appwrite:/usr/src/code/appwrite:rw ,
    --entrypoint="install" ,
    appwrite/appwrite:0.13.4
```

Once the Docker installation completes, go to <http://localhost> to access the Appwrite console from your browser. Please note that on non-linux native hosts, the server might take a few minutes to start after installation completes.

For advanced production and custom installation, check out our Docker [environment variables](docs/tutorials/environment-variables.md) docs. You can also use our public [docker-compose.yml](https://appwrite.io/docker-compose.yml) file to manually set up and environment.

## Setting up appwrite project

#### Flutter

To build and run this project:

1. Get Flutter [here](https://docs.flutter.dev/get-started/install) if you don't already have it
2. Clone this repository
3. `cd` into the repo folder
4. Run `flutter pub get` to get the dependencies
5. Run `flutter run-android` or `flutter run-ios` to build the app

(Please note that a Mac with XCode is required to build for iOS)

#### Appwrite

To setup your Appwrite project:

1. Open your browser and go to your <http://localhost>
2. Create your account and login.
3. Click on `Create Project`.
4. Enter a Name and custom Project ID for your project and click create.

At this moment your Dashboard is ready to use.
