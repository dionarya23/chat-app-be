# Rails Real-Time Chat API

This is the backend API for a real-time chat application built with Ruby on Rails, MySQL, and Pusher. The API provides endpoints for creating chat rooms, sending messages, and retrieving messages in real-time.

## Features

- **Chat Rooms**: The API supports multiple chat rooms.
- **Real-Time Messaging**: Messages are broadcasted in real-time using Pusher.
- **RESTful Endpoints**: The API exposes endpoints for retrieving and sending messages.
- **MySQL Database**: All data is stored in a MySQL database.

## Technologies Used

- **Ruby on Rails**: A web application framework written in Ruby.
- **MySQL**: A relational database for storing chat rooms and messages.
- **Pusher**: Real-time message broadcasting.
- **Rack-CORS**: For handling CORS between the frontend and backend.
- **ActiveRecord**: Rails ORM for database operations.

## Prerequisites

Before running this project, ensure you have the following installed:

- **Ruby**: [Download Ruby](https://www.ruby-lang.org/en/downloads/)
- **Rails**: [Download Rails](https://guides.rubyonrails.org/getting_started.html)
- **MySQL**: [Download MySQL](https://dev.mysql.com/downloads/)
- **Pusher Account**: [Sign up for Pusher](https://pusher.com/)

## Getting Started

Follow these steps to set up and run the Rails API locally.

### 1. Clone the Repository

```bash
git clone https://github.com/dionarya23/chat-app-be.git
cd your-backend-repo
```

### 2. Install Dependencies
Run the following command to install all dependencies:

```bash
bundle install
```

### 3. Set Up Environment Variables
Create a ```.env``` file in the root of your project and add your MySQL and Pusher credentials:

```bash
PUSHER_APP_ID=your_pusher_app_id
PUSHER_KEY=your_pusher_key
PUSHER_SECRET=your_pusher_secret
PUSHER_CLUSTER=your_pusher_cluster
DB_USERNAME=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_HOST=localhost  # or your MySQL host
```

### 4. Set Up the Database
Run the following commands to create the MySQL database and run migrations:
```bash
rails db:create
rails db:migrate
```
This will create the necessary tables in your MySQL database.

### 5. Seed the Database (Optional)
If you want to seed some initial data (e.g., chat rooms), run:

```bash
rails db:seed
```

### 6. Start the Server
To start the Rails server, run:

```bash
rails server
```
The API will be accessible at ```http://localhost:3000```.


## API Endpoints
### 1. Get All Rooms

### Endpoint: ```GET /api/rooms```

Fetches all available chat rooms.

```bash
curl http://localhost:3000/api/rooms
```

Response:
```json
[
  { "id": 1, "room_name": "General" },
  { "id": 2, "room_name": "Tech" },
  { "id": 3, "room_name": "Design" }
]
```

### 2. Get Messages by Room ID
### Endpoint: ```GET /api/rooms/:room_id/messages```

Fetches all messages for a given room.
```bash
curl http://localhost:3000/api/rooms/1/messages
```
Response:
```json
{
  "messages": [
    { "user": "JohnDoe", "message": "Hello there!" },
    { "user": "JaneDoe", "message": "Hi!" }
  ]
}
```

### 3. Send a Message
### Endpoint: ```POST /api/rooms/:room_id/messages```

Sends a new message to the specified room.
```bash
curl -X POST http://localhost:3000/api/rooms/1/messages \
-H "Content-Type: application/json" \
-d '{"message": {"user": "JohnDoe", "message": "Hello!"}}'
```

Response:
```json
{
  "user": "JohnDoe",
  "message": "Hello!"
}
```
