-- CREATE: Add a new user 
INSERT INTO auth_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined)
VALUES ('pbkdf2_sha256$...', NULL, 0, 'new_test_user', '', '', '', 0, 1, NOW());

-- READ: Select all messages in a specific thread
SELECT * FROM chat_message WHERE thread_id = 1;

-- UPDATE: Change a username color
UPDATE chat_profile SET username_color = '#ff00ff' WHERE user_id = 2;

-- DELETE: Remove a specific thread 
DELETE FROM chat_chatthread WHERE id = 1;

-- CREATE: Send a new friend request 
INSERT INTO chat_friendrequest (from_user_id, to_user_id, is_accepted, timestamp)
VALUES (2, 3, 0, NOW());

-- UDPATE: Accept a friend request 
UPDATE chat_friendrequest SET is_accepted = 1 WHERE from_user_id = 2 AND to_user_id = 3;

-- RECURSIVE QUERY: Find mutual friends 
WITH RECURSIVE mutual_friends AS (
    SELECT fr1.from_user_id AS user1, fr1.to_user_id AS user2
    FROM chat_friendrequest fr1
    WHERE fr1.is_accepted = 1
    UNION
    SELECT mf.user1, fr2.to_user_id
    FROM mutual_friends mf
    JOIN chat_friendrequest fr2 ON mf.user2 = fr2.from_user_id
    WHERE fr2.is_accepted = 1 AND fr2.to_user_id != mf.user1
)
SELECT * FROM mutual_friends WHERE user1 = 2;

-- ADVANCED QUERY: Number of messages per user in all threads 
SELECT username, COUNT(*) AS total_messages
FROM chat_message
GROUP BY username
ORDER BY total_messages DESC;