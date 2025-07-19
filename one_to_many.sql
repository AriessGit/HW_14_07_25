CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department_id INTEGER,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, name) VALUES
(1, 'Finance'), (2, 'IT'), (3, 'HR'), (4, 'Marketing');

INSERT INTO employees (employee_id, name, department_id) VALUES
(1, 'Shira', 1), (2, 'Doron', 2), (3, 'Tal', 2), (4, 'Adi', 3),
(5, 'Omer', NULL), (6, 'Yoni', 1), (7, 'Michal', NULL),
(8, 'Liad', 4), (9, 'Noga', 2), (10, 'Rami', 1);

--הצג את כל העובדים עם שם המחלקה שלהם
SELECT e.name AS Employee_name, d.name AS Department FROM employees e 
JOIN departments d ON e.department_id = d.department_id;

--הצג את כל המחלקות וספור כמה עובדים יש לכל מחלקה
SELECT d.name AS Department, COUNT(e.department_id) AS Number_of_Workers FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id ;

--הצג את כל העובדים כולל כאלה שלא שויכו למחלקה
SELECT e.name AS Employee_name, d.name AS Department FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id;

--הצג מחלקות שאין בהן אף עובד
--מכיוון שבתרגיל,בכל מחלקה ישנם אנשים, עדכנתי את טבלת המחלקות והוספתי מחלקה חדשה שלא היתה קיימת, להמחשה ויזואלית

INSERT INTO departments (department_id, name) VALUES (5, 'Analytics');

SELECT d.name AS Department, e.name AS Employee_name FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
WHERE e.name is NULL;
