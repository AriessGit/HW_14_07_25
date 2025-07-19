CREATE TABLE citizens (
    citizen_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE cable_tv (
    company_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE subscriptions (
    citizen_id INTEGER,
    company_id INTEGER,
    PRIMARY KEY (citizen_id, company_id),
    FOREIGN KEY(citizen_id) REFERENCES citizens(citizen_id),
    FOREIGN KEY(company_id) REFERENCES cable_tv(company_id)
);

INSERT INTO citizens (citizen_id, name) VALUES
(1, 'Rina'), (2, 'Avi'), (3, 'Lea'), (4, 'Moshe'),
(5, 'Gali'), (6, 'Bar'), (7, 'Itai'), (8, 'Sivan'),
(9, 'Elior'), (10, 'Hodaya');

INSERT INTO cable_tv (company_id, name) VALUES
(1, 'HOT'), (2, 'YES'), (3, 'Partner TV');

INSERT INTO subscriptions (citizen_id, company_id) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 1), (4, 1),
(5, 3), (6, 3), (6, 1),
(7, 2);

--הצג את כל המנויים עם שם האזרח ושם החברה
SELECT ci.name AS USER, ca.name AS TV_COMPANY FROM subscriptions s 
JOIN citizens ci  ON ci.citizen_id = s.citizen_id
JOIN cable_tv ca ON ca.company_id  = s.company_id 

--הצג את כל האזרחים ובכמה חברות הם מנויים 
SELECT ci.name AS USER, COUNT(s.company_id) AS COMP_SUBS FROM citizens ci
LEFT JOIN subscriptions s ON ci.citizen_id = s.citizen_id
GROUP BY ci.citizen_id

--הצג את כל חברות הכבלים וכמה מנויים יש להן
SELECT ca.name AS COMPANY, COUNT(s.citizen_id) AS USERS FROM cable_tv ca
JOIN subscriptions s ON ca.company_id = s.company_id
GROUP BY ca.company_id

--הצג אזרחים שלא מנויים לאף חברה
SELECT c.name AS USER, s.company_id AS COMPANY FROM citizens c 
LEFT JOIN subscriptions s  ON c.citizen_id = s.citizen_id
WHERE s.company_id IS NULL;

--הצג חברות שאין להן אף מנוי
INSERT INTO cable_tv (company_id, name) VALUES (4, 'Cellcome_TV');

SELECT ca.name AS COMPANY, s.company_id AS USER FROM cable_tv ca 
LEFT JOIN subscriptions s  ON ca.company_id = s.company_id
WHERE s.citizen_id IS NULL;
