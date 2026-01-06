CREATE TABLE users (
    username VARCHAR2(50) PRIMARY KEY,
    password_hash VARCHAR2(64) NOT NULL
);

INSERT INTO users (username, password_hash) 
VALUES ('admin', 'secure_pass_123');
