CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);


-- Load data into employees table
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/tmp/employees.csv'
DELIMITER ','
CSV HEADER;

-- Load data into departments table
COPY departments(dept_no, dept_name)
FROM '/tmp/departments.csv'
DELIMITER ','
CSV HEADER;

-- Load data into dept_emp table
COPY dept_emp(emp_no, dept_no)
FROM '/tmp/dept_emp.csv'
DELIMITER ','
CSV HEADER;

-- Load data into dept_manager table
COPY dept_manager(dept_no, emp_no)
FROM '/tmp/dept_manager.csv'
DELIMITER ','
CSV HEADER;

-- Load data into salaries table
COPY salaries(emp_no, salary)
FROM '/tmp/salaries.csv'
DELIMITER ','
CSV HEADER;

-- Load data into titles table
COPY titles(title_id, title)
FROM '/tmp/titles.csv'
DELIMITER ','
CSV HEADER;
