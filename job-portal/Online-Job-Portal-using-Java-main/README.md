# Online-Job-Portal-using-Java
The Online Job Search is a Java Dynamic Web Project created using JavaServer Pages, Servlets, and MySQL. 
The Online Job Search project is a comprehensive online job search platform that allows users to search for open jobs, create job postings, and manage job postings.
1. We have used JSP (JavaServer Pages), CSS & Bootstrap for frontend and backend with Java. 
2. We used servlet  for creating a web application which presents the user with a browser based interface.  
3. The backend database for the web application is MySQL and I have used MySQL workbench and MySQL query browser for managing the database. 
4. The web application is deployed in the tomcat server.


add dependency for servelet

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    status VARCHAR(50),
    location VARCHAR(255),
    pdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    qualification VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);


-- Create the user (if it doesn't exist)
CREATE USER 'admin@gmail.com'@'localhost' IDENTIFIED BY 'admin';

-- Grant privileges on the job_portal database
GRANT ALL PRIVILEGES ON job_portal.* TO 'admin@gmail.com'@'localhost';

-- Flush privileges to ensure that the changes take effect
FLUSH PRIVILEGES;

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    status VARCHAR(50),
    location VARCHAR(255),
    pdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    qualification VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE job_applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    user_id INT,
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    comments TEXT,
    user_name VARCHAR(255),
    user_email VARCHAR(255),
    job_title VARCHAR(255),
    qualification VARCHAR(255),
    FOREIGN KEY (job_id) REFERENCES jobs(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

//here designing the footer
