# 📝 To-Do List Application (Node.js + MongoDB + DevOps CI/CD + Kubernetes)

## 📌 Project Overview

This is a full-stack **To-Do List Web Application** built using `Node.js`, `Express.js`, and `MongoDB` that allows users to **create**, **update**, **delete**, and **categorize** tasks. The application includes a frontend rendered using `EJS` and styled with `CSS`, and a backend with RESTful routes and MongoDB database integration.

In addition to building the application, we implemented a complete DevOps lifecycle using:

- **Docker** for containerization
- **GitHub Actions** for CI/CD
- **Ansible** for remote server provisioning
- **Kubernetes** for orchestration
- **ArgoCD** for GitOps-based continuous delivery

---

## 🚀 Features

- ✅ Create, update, and delete tasks
- 🏷️ Categorize tasks using labels (e.g., Work, Personal)
- 🔒 Secure credentials using Ansible Vault
- 📦 Containerized with Docker and deployed via Docker Compose or Kubernetes
- 🔄 CI/CD pipeline with GitHub Actions and automated image tagging
- ⚙️ Ansible automation for provisioning servers and deployment setup
- 🧠 Self-updating Docker deployment with systemd service
- ☸️ Kubernetes deployment with ArgoCD-based CD

---

## 🧰 Tech Stack

| Layer       | Technologies |
|-------------|--------------|
| Frontend    | EJS, CSS, JavaScript |
| Backend     | Node.js, Express.js |
| Database    | MongoDB, Mongoose |
| DevOps      | Docker, GitHub Actions, Ansible, systemd, Kubernetes, ArgoCD |

---

## 📂 Project Structure
```

Todos-nodejs/
├── controllers/
├── models/
├── public/
├── routes/
├── views/
├── .env
├── Dockerfile
├── docker-compose.yaml
├── update-todo.sh
├── app.js
├── package.json
├── .github/workflows/
│   └── CI.yaml
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── secret.yaml
│   └── kustomization.yaml
├── ansible/
│   ├── inventory
│   ├── playbook.yaml
│   ├── vault.yaml
│   └── install-minikube.yaml

```

## Run Locally

Clone the project

```bash
  git clone https://github.com/Ankit6098/Todos-nodejs
```

Go to the project directory and open index.html file

```bash
  cd Todos-nodejs
```

Install the packages

```bash
  npm install / npm i
```

Start the Server

```bash
    npm start / nodemon start
```
Visit http://localhost:4000

## Acknowledgements

 - [nodemon](https://nodemon.io/)
 - [mongoDb](https://www.mongodb.com/)
 - [mongoose](https://mongoosejs.com/)


## Screenshots

![225232515-4c100b6b-52e4-40f8-a6d4-85e30dc2f5e7](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/487f548f-7ca6-4183-9443-c88c9f79c3f0)
![225232960-da554f1f-ba4a-41f8-9856-edaebe339d76](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/25515d2e-1d72-498d-8044-59a01c6b9127)
![225238829-05433362-5b16-454c-92d5-5e536fe6912e](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/316d15ca-1fe8-4581-80b1-fc316340bba6)
![225239140-226f8eae-d8b8-4055-8a68-d85d523c2422](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/44a0c418-449e-446f-8a8e-3c4e14fca8bf)
![225239221-caf86f3d-ef17-4d18-80a6-c72123ff5444](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/2ee90ab0-95d4-44f4-80ac-b17b088ac1ce)
![225239406-98b7ba7d-df97-4d27-bb66-596a32187d87](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/960ff353-1ce9-4ef8-94e4-10af09184fd2)
![225239841-4b5d77f0-4a54-4339-b6b3-b6a1be6776b5](https://github.com/Ankit6098/Todos-nodejs/assets/92246613/f5ffc3b8-480f-4d11-9a0b-c469e3c17e8e)


## CI/CD with GitHub Actions

- Builds and pushes Docker images to Docker Hub
- Saves image tag to .env for future deployment

## 🤖Ansible Automation
Located in the ansible/ directory:

- playbook.yaml:
  Installs Docker, Docker Compose, Git, Node.js, and sets up your to-do app.

- vault.yaml:
  Stores encrypted DockerHub credentials using ansible-vault. Used for private image pulls.

- install-minikube.yaml:
  Installs Minikube, kubectl, and other dependencies to simulate a local Kubernetes cluster on EC2 or VM.

- inventory:
  Contains your target machine IP or hostname.

To run the playbook:
```bash
    ansible-playbook -i inventory playbook.yaml --ask-vault-pass
```

## Docker Compose 
This project uses Docker Compose to run the application and a todo-updater service that monitors the .env file for changes in the TAG value. When a new tag is detected (e.g., after pushing a new image), the todo-updater will:

- Pull the updated Docker image using the new tag.
- Recreate the main application container to use the new image.

## Kubernates and Argocd (instead of Docker Compose)
Files:
- deployment.yaml – App deployment

- service.yaml – Exposes the app

- secret.yaml – Docker credentials secret

- kustomization.yaml – Kustomize root

🚢 Continuous Delivery with ArgoCD
1- Add the repo in ArgoCD UI or CLI

2- Point to the k8s/ folder as Kustomize root

3- Enable auto-sync

4- When a new image tag is pushed and .env is updated, the ArgoCD sync will update the cluster
![ArgoCD Screenshot](assets/argo.png)







## Feedback

If you have any feedback, please reach out to us at yaramaher368@gmail.com

