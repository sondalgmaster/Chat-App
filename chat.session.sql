create DATABASE chat;


-- @block
drop DATABASE chat;
CREATE DATABASE if NOT EXISTS chat;

-- @block
USE chat;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    display_name VARCHAR(255),
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE friendships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT,
    user2_id INT,
    FOREIGN KEY (user1_id) REFERENCES users(id),
    FOREIGN KEY (user2_id) REFERENCES users(id)
);

CREATE TABLE private_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    friendships_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (friendships_id) REFERENCES friendships(id)
);

CREATE TABLE `groups` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    creator_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE group_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_id INT,
    member_id INT,
    FOREIGN KEY (group_id) REFERENCES `groups`(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE group_chat_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    user_id INT,
    group_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES `groups`(id)
);

CREATE TABLE public_chat_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    user_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE inbox_participants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inbox_uid INT
);
