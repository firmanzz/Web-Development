# 🎥 Movie CMS

**Movie CMS** is a web-based content management system for managing movies, actors, directors, countries, genres, comments, and other related information. This project leverages modern backend and frontend technologies to deliver a fast and efficient user experience.

---
## ✍️ Author
<!-- image round -->
<div align="center">
  <!-- table border 0 -->
    <table border="0">
        <tr>
        <td align="center">
            <a href="https://github.com/firmanzz">
                <img src="https://avatars.githubusercontent.com/u/124325264?v=4" width="100" alt="firmanzz" style="border-radius: 50%" />
            </a>
            <br>
            <a href="https://github.com/firmanzz" style="color:white;">firmanzz</a>
        </td>
        <td align="center">
            <a href="https://github.com/Matharrr">
                <img src="https://avatars.githubusercontent.com/u/117796799?v=4" width="100" alt="Matharrr" style="border-radius: 50%" />
            </a>
            <br>
            <a href="https://github.com/Matharrr" style="color:white;">Matharrr</a>
        </td>
        </tr>
        </table>
</div>

## 📸 Preview
### Admin Dashboard

### Movie Details

## 🛠️ Technologies Used

### Backend
- **Frameworks & Libraries**:
  - [Express.js](https://expressjs.com/) - A backend framework for building RESTful APIs.
  - [Sequelize](https://sequelize.org/) - ORM for database interaction.
  - [Nodemailer](https://nodemailer.com/) - For sending emails (notifications/reset password).
  - [Passport.js](http://www.passportjs.org/) - User authentication (including Google OAuth).

- **Database**:
  - PostgreSQL (production).

- **Testing**:
  - [Jest](https://jestjs.io/) - Framework for unit and integration testing.
  - [Supertest](https://github.com/visionmedia/supertest) - For API endpoint testing.

- **Linting & Utilities**:
  - ESLint, Prettier, and dotenv.

---

### Frontend
- **Frameworks & Libraries**:
  - [React.js](https://reactjs.org/) - Frontend framework for building user interfaces.
  - [React Router](https://reactrouter.com/) - For page routing.
  - [Tailwind CSS](https://tailwindcss.com/) - CSS framework for styling.

- **Testing**:
  - [Jest](https://jestjs.io/) - For unit testing.

- **Linting & Utilities**:
  - ESLint, Prettier, and PostCSS.

---

## 📂 Project Structure

### Backend
```plaintext
├── controllers       # Controllers to handle API requests
├── models            # Sequelize models for the database
├── routes            # API routes
├── middleware        # Middleware for authentication, file uploads, etc.
├── utils             # Utility functions like nodemailer
├── static            # Folder for uploaded files
├── __tests__         # Jest test files
├── jest.config.js    # Jest configuration
└── server.js         # Backend entry point
```
### Frontend
```plaintext
├── src
│   ├── components    # UI components such as Sidebar, Filter, etc.
│   ├── pages         # Pages like Home, MovieDetail, etc.
│   ├── routes        # Frontend routing
│   ├── App.js        # React app entry point
│   └── tailwind.config.js # Tailwind CSS configuration
└── public            # Static assets
```

## 📦 Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/username/movie-cms.git
   cd Web-Development
   ```
### Backend
1. **Navigate to the backend folder:**
    ```bash
    cd backend
    ```
2. **Install dependencies:**
    ```bash
    npm install
    ```
3. **Configure environment: Create a .env file in the backend folder and add the following variables:**
    ```bash
    DATABASE_NAME=postgres
    DATABASE_USER=YOUR_DB_USERNAME
    DATABASE_PASSWORD=YOUR_DB_PASSWORD
    DATABASE_HOST=localhost
    DATABASE_DIALECT=postgres
  
    AUTH_SECRET="YOUR_AUTH_SECRET_CODE" # Added by `npx auth`. Read more: https://cli.authjs.dev
    PORT=5000
  
    GOOGLE_CLIENT_ID=YOUR_CLIENT_ID # CREATED AT GOOGLE CLOUD CONSOLE
    GOOGLE_CLIENT_SECRET=YOUR_CLIENT_SECRET # CREATED AT GOOGLE CLOUD CONSOLE
    GMAIL_USER=YOUR_GMAIL_EMAIL
    GMAIL_PASS=YOUR_16_DIGIT_GMAIL_PASS
    
    DUMMY_TOKEN=122333444455555666666777777788888888999999999
    ```
4. **Start the server:**
    ```bash
    npm run dev
    ```
    or
    ```bash
    node server.js
    ```
### Frontend
1. **Navigate to the frontend folder:**
    ```bash
    cd frontend
    ```
2. **Install dependencies:**
    ```
    bash
    npm install
    ```
3. **Start the frontend application:**
    ```bash
    npm start
    ```
4. **Open the application in your browser:** `http://localhost:3000`
### Database
1. **Import database**
    ```bash
    psql -U <username> -h <host> -p <port> -d <database_name> -f database_web.sql
    ```

