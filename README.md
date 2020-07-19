# Operationalizing ML Microservices with Docker & Kubernetes

[![CircleCI](https://circleci.com/gh/vikiscience/fancy_microservice_on_kubernetes.svg?style=shield)](https://app.circleci.com/pipelines/github/vikiscience/fancy_microservice_on_kubernetes)

In this project, the goal is to operationalize a Machine Learning Microservice API using [Kubernetes](https://kubernetes.io), which is an open-source system for automating the management of containerized applications.

An `sklearn` model is given which has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and [so on](https://www.kaggle.com/c/boston-housing). The pre-trained model is wrapped in a `Flask` application that serves out predictions (inference) about housing prices through API calls. 

The Flask app can be containerized with [Docker](https://www.docker.com/) and deployed to a Kubernetes Cluster by running the steps described below.


## Project structure

The folder `model_data` contains the pre-trained ML model as well as a CSV file with the whole Boston Housing dataset, which may be used to test the model.

The folder `output_txt_files` contains the log results of running the scripts `run_docker.sh` and `run_kubernetes.sh`, respectively.

`app.py` implements the Flask application, which loads the given model and contains of 2 routes:

1) `/` route shows a simple HTML page to indicate that the app is running.

2) `/predict` route receives POST requests with house input features (average number of rooms etc.) and sends back the response with the house price in $1,000s.

The app is containerized by means of `Dockerfile` and tested by running a CircleCI pipeline based on `.circleci/config.yml`.


## How To

##### Run the app locally (optional)

* Set up virtual environment with all dependencies from `requirements.txt`:

```shell script
make setup
source ~/.devops/bin/activate
make install
```

* Start the app:

```shell script
python app.py
```

* Test the app:

```shell script
curl http://localhost:8080/
```

##### Run with Docker

* Build and start Docker container with the app inside:

```shell script
./run_docker.sh
```

* Upload the created image to a DockerHub repository:

```shell script
./upload_docker.sh
```

* Deploy Docker image into an existing Kubernetes Cluster (eg. [Minikube](https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-intro/))

```shell script
./run_kubernetes.sh
```

* Test the running app by making a prediction:

```shell script
./make_prediction.sh
```
