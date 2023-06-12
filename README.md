<a name="readme-top"></a>
<div align="center">
</div>

<div align="center">

  <h2><b>Private Parking</b></h2>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Private Parking ](#-Private Parking-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [Front-end repository link](#front-end-repository-link)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Check Linter](#check-linter)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->


# 📖 Private Parking <a name="about-project"></a>

This is a full-stack project with CURD operations. In which you can register yourself create a slots, book an parking slot
, see all reservations.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>React</li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li>Ruby on Rails</li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li>Postgresql</li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- User can register himself.
- Add a slot.
- Book a slot.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->
### 🚀 Live Demo <a name="live-demo"></a>

- [API on Render]()

## Front-end repository link

- <a href="https://github.com/Zainab-Alzubair/private-parking-frontend" target="_blank">React Front-end</a>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```

 - Laptop/Desktop.
 - Internet.
 - Ruby.
 - Rails.
 - PostgreSQL.
 - Vs Code.

```

### Setup

Clone this repository to your desired folder:

```sh
 mkdir my-folder
 cd my-folder
 git clone git@github.com:Zainab-Alzubair/private-parking-backend.git
 cd private-parking-backend
```
 - Remove config/master.key and config/credentials.yml.enc if they exist.
 - Run in the terminal: 
```sh
 EDITOR=code rails credentials:edit 
```
 - This command will create a new master.key and credentials.yml.enc if they do not exist.
```sh
 bundle install
```
 - Change username and password in config/database.yml file
 - Run these commands to create and migrate database schema
```sh
 rails db:create
 rails db:migrate
```
### Usage

To run the project, execute the following command:
```sh
rails server
```

### Run tests
```sh
rails db:migrate RAILS_ENV=test
rspec ./spec/models/
```

### Check Linter 
```sh
rubocop
```

### Deployment

- For deployement on render follow the instructions.
[Getting Started with Ruby on Rails on Render](https://render.com/docs/deploy-rails#:~:text=On%20the%20Render%20Dashboard%2C%20go,key%20file.)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

**Zainab Al-Zubair**
- GitHub: [Zainab Al-Zubair](https://github.com/Zainab-Alzubair)
- LinkedIn: [Zainab Al-Zubair](https://www.linkedin.com/in/zainab-alzubair/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **Add Full Authorization**
- **Developing more pages**
- **Enhance Design**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can fork it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>