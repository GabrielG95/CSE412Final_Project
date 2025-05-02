# Django Chatters 
A full-stack real-time chat web application built using Django, MySQL, and Bootstrap.
Users can chat in a global room or thread-based chatrooms. 
Users can register/login, use anonymous usernames, and send friend requests to other uers.

---

## Features 
- Register/login systsem using Djanog's auth
- Global chatroom and custom threads
- Anonymous and random username support
- Real-time message updates (via AJAX polling)
- Friend request system (mutal tracking)
- Username color customization (profile)
- Responsive UI with Bootstrap

---

## Technologies Used 
- Backend: Python 3.11.11 (Django)
- Frontend: HTML, CSS, Bootstrap 5, JavaScript
- Database: MySQL (hosted via AWS RDS)
- Virtual Environment: Conda 
- Other: Django ORM, AJAX, MySQL dump

## Setup Instructions

### 1. Clone the Repository 
git clone https://github.com/GabrielG95/CSE412Final_Project
cd CSE412Final_Project

### 2. Create and Activate Conda Environment
conda create --name CSE412Final_Project python=3.11.11
conda activate CSE412Final_Project

### 3. Install Dependencies 
pip install -r requirements.txt 

### 4. Configure Database
Already set up for the database I used for the project.

### 5. Run migrations and Start the Server 
python manage.py migrate
python manage.py runserver