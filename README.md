# 🍲 Recipe Management System (JSP + JDBC + MySQL)

A simple **CRUD web application** built using **JSP, JDBC, MySQL** and deployed on **Apache Tomcat 10.1**.  
This project lets you **Add, View, Update, and Delete** recipes with details like name, ingredients, and instructions.

---

## ✨ Features
- ➕ Add new recipes  
- 📖 View all recipes in a clean table  
- ✏️ Update existing recipes  
- ❌ Delete recipes  
- 🎨 Simple & attractive UI with styled forms and tables  

---

## 🛠 Tech Stack
- **Frontend:** HTML, CSS, JSP  
- **Backend:** Java (JDBC)  
- **Database:** MySQL 8+  
- **Server:** Apache Tomcat 10.1  
- **IDE:** Eclipse (Dynamic Web Project)  

---

## 📂 Project Structure
```
Recipe-Management-JSP/
│── src/com/           # Java classes (DB connection, Models)
│── WebContent/
│   ├── META-INF/
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── lib/mysql-connector-j-8.4.0.jar
│   ├── register.html   # Recipe form
│   ├── insert.jsp      # Insert logic
│   ├── view.jsp        # Show recipes in table
│   ├── update.jsp      # Update recipe
│   └── delete.jsp      # Delete recipe
│── .gitignore
│── README.md
```

---

## Screenshots
<img width="1132" height="882" alt="image" src="https://github.com/user-attachments/assets/af892143-b2f9-4bb6-bad1-1604365bdbae" />
<img width="1887" height="509" alt="image" src="https://github.com/user-attachments/assets/81e98227-3564-43c3-872c-97b4f4281cc7" />
<img width="972" height="852" alt="image" src="https://github.com/user-attachments/assets/c14e065a-12db-4e7b-a793-e146bccf995e" />
<img width="908" height="423" alt="image" src="https://github.com/user-attachments/assets/47083db4-1ec5-4b0b-aad3-74274bb11ade" />

## ⚙️ Setup Instructions

### 1️⃣ Clone Repository
```bash
git clone https://github.com/your-username/Recipe-Management-JSP.git
cd Recipe-Management-JSP
```

### 2️⃣ Database Setup
Open MySQL and run:
```sql
CREATE DATABASE recipedb;
USE recipedb;

CREATE TABLE recipes (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    ingredients TEXT,
    instructions TEXT
);
```

### 3️⃣ Configure Eclipse Project
1. Create a **Dynamic Web Project** in Eclipse.  
2. Copy project files into it.  
3. Place `mysql-connector-j-8.4.0.jar` inside:  
   ```
   WebContent/WEB-INF/lib/
   ```
4. Add Tomcat 10.1 server in Eclipse.  

### 4️⃣ Run the Project
- Start Tomcat server.  
- Open in browser:  
  ```
  http://localhost:8080/Recipe-Management-JSP/register.html
  ```
  
---
✨ Built with ❤️ using JSP + JDBC + MySQL
