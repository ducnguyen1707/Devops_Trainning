CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'Engineering', 90000),
('Bob', 'Sales', 75000),
('Charlie', 'HR', 60000),
('Diana', 'Engineering', 95000),
('Eve', 'Marketing', 70000);
