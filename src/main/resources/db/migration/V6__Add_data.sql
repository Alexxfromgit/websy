INSERT INTO usr (id, username, password, active, email)
VALUES (
   2,
   'Del Ray',
   '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6',
   true,
   'del.ray@gmail.com'
);

INSERT INTO user_role (user_id, roles)
VALUES (2,'USER');

INSERT INTO message (id, tag, text)
VALUES (
    1,
    'java',
    'You can use the Java EE tools and features to create applications that are structured around modules with different purposes, such as web sites and Enterprise Java bean (EJB) applications. When you use EJB 3.1 components, you can create a distributed, secure application with transactional support.'
);

INSERT INTO message_likes (user_id, message_id)
VALUES (1, 1), (2, 1);