-- -----------------------------------------------------
-- Database: Complaint Management System
-- -----------------------------------------------------

DROP DATABASE IF EXISTS cms;
CREATE DATABASE cms;
USE cms;

-- -----------------------------------------------------
-- Table: users
-- -----------------------------------------------------
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(100) NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       role ENUM('Admin', 'Employee') NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table: complaints
-- -----------------------------------------------------
CREATE TABLE complaints (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            user_id INT NOT NULL,
                            title VARCHAR(100) NOT NULL,
                            description TEXT NOT NULL,
                            status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
                            remarks TEXT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Admins
-- -----------------------------------------------------
INSERT INTO users (username, password, full_name, role)
VALUES ('admin2', 'admin123', 'System Administrator', 'Admin');