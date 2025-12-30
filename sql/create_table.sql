-- -- Create users table
-- CREATE TABLE IF NOT EXISTS users (
--     id BIGINT AUTO_INCREMENT PRIMARY KEY,
--     username VARCHAR(100) NOT NULL UNIQUE,
--     email VARCHAR(150) NOT NULL UNIQUE,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- -- Create orders table
-- CREATE TABLE IF NOT EXISTS orders (
--     id BIGINT AUTO_INCREMENT PRIMARY KEY,
--     user_id BIGINT NOT NULL,
--     order_total DECIMAL(10,2) NOT NULL,
--     status VARCHAR(50) NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     CONSTRAINT fk_orders_users
--         FOREIGN KEY (user_id) REFERENCES users(id)
-- );
-- Create users table if not exists
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    company VARCHAR(50),
    domain VARCHAR(50),
    team VARCHAR(50)
);

-- Insert initial user data
INSERT INTO users (username, email, company, domain, team)
VALUES 
('babu', 'babu@enreap.com', 'enreap', 'devops cloud', 'devops'),
('avinash', 'avinash@enreap.com', 'enreap', 'devops cloud', 'devops'),
('ketki', 'ketki@enreap.com', 'enreap', 'devops cloud', 'devops'),
('suhas', 'suhas@enreap.com', 'enreap', 'devops cloud', 'devops'),
('sangram', 'sangram@enreap.com', 'enreap', 'devops cloud', 'devops'),
('nithis', 'nithis@enreap.com', 'enreap', 'devops cloud', 'devops');
