-- Active: 1708643350797@@127.0.0.1@3306

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME())
);

INSERT INTO users(id, name, email, password)
VALUES('u001', 'Fulano', 'f@gmail.com','123456'), ('u002', 'Ciclano', 'c@gmail.com','123456'), ('u003', 'Geraldo', 'g@gmail.com','123456');

SELECT * FROM users;


CREATE TABLE followss (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO followss (follower_id, followed_id)
VALUES('u001', 'u002'), ('u001', 'u003'), ('u002', 'u001');

--Vai pegar todas as pessoas que estão se seguindo:
SELECT * FROM users
INNER JOIN followss
ON users.id = followss.follower_id


SELECT * FROM users
LEFT JOIN followss
ON followss.follower_id = users.id;


SELECT users.id AS userId,
users.name AS userName,
users.email,
users.password,
users.created_at AS createdAt,
followss.followed_id AS followedId,
usersFollowed.name AS followedName
FROM users
LEFT JOIN followss
ON followss.followed_id = users.id
INNER JOIN users AS usersFollowed
ON followss.followed_id = usersFollowed.id;
