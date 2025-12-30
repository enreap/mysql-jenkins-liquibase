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
