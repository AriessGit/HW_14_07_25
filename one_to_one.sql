CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE passwords (
    user_id INTEGER UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

INSERT INTO users (user_id, name) VALUES
(1, 'Lior'), (2, 'Tamar'), (3, 'Erez'), (4, 'Dana'),
(5, 'Amit'), (6, 'Yael'), (7, 'Noam'), (8, 'Hila'),
(9, 'Aviad'), (10, 'Shani');

INSERT INTO passwords (user_id, password_hash) VALUES
(1, 'abc123'), (2, 'pass456'), (3, 'hello789'), (4, 'secure321'),
(5, 'qwerty12'), (6, 'secret99');

--הצג את כל המשתמשים עם הסיסמה שלהם (INNER JOIN)
SELECT u.name , p.password_hash FROM users u
JOIN passwords p ON u.user_id = p.user_id  ;

--הצג את כל המשתמשים, גם כאלה שאין להם סיסמה (LEFT JOIN
SELECT u.name , p.password_hash FROM users u
LEFT JOIN passwords p ON u.user_id = p.user_id  ;

--הצג את המשתמשים שאין להם סיסמה כלל
SELECT u.name , p.password_hash FROM users u
LEFT JOIN passwords p ON u.user_id = p.user_id 
WHERE p.password_hash is NULL ;
