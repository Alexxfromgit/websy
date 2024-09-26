INSERT INTO usr (id, username, password, active, email)
VALUES (
   2,
   'user2',
   '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6',
   true,
   'del.ray@gmail.com'
),
(
   3,
   'user3',
   '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6',
   true,
   'user.3@gmail.com'
),
(
   4,
   'user4',
   '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6',
   true,
   'user.4@gmail.com'
);

INSERT INTO user_role (user_id, roles)
VALUES (2,'USER'), (3, 'USER'), (4, 'USER');

INSERT INTO message(id, tag, text, user_id)
VALUES (
    1,
    'java',
    'You can use the Java EE tools and features to create applications that are structured around modules with different purposes, such as web sites and Enterprise Java bean (EJB) applications. When you use EJB 3.1 components, you can create a distributed, secure application with transactional support.',
    1
),
(
    2,
    'java8',
    'Java EE 8 continues to improve API and programming models needed for today''s applications and adds features requested by our world-wide community. This release modernizes support for many industry standards and continues simplification of enterprise ready APIs.',
    1
),
(
    3,
    'test',
    'A Standardized Development Model for all Java EE Developers',
    2
),
(
    4,
    'testng',
    'A description of the testng.xml file, its syntax and what you can specify in it',
    1
),
(
    5,
    'java',
    'Java Platform, Enterprise Edition (Java EE) is the standard in community-driven enterprise software. Java EE is developed using the Java Community Process, with contributions from industry experts, commercial and open source organizations, Java User Groups, and countless individuals.',
    2
),
(
    6,
    'junit',
    'JUnit Overview - Learn JUnit testing framework in simple and easy steps starting from Environment Setup, Test Framework, Basic usage, Writing a Test.',
    1
),
(
    7,
    'java',
    'Today, Java EE offers a rich enterprise software platform and with over 20 compliant Java EE implementations to choose from.',
    3
),
(
    8,
    'test',
    'Java EE and Glassfish',
    3
),
(
    9,
    'jbehave',
    'JBehave is a framework for Behaviour-Driven Development (BDD). Features ... User stories can be written in JBehave syntax or Gherkin syntax.',
    1
),
(
    10,
    'cucumber',
    'Cucumber Features - Learn Cucumber starting from Overview, Environment, Gherkins.',
    3
),
(
    11,
    'python',
    'Python is an interpreted objectoriented programming language similar to PERL that has gained popularity because of its clear syntax.',
    3
);

INSERT INTO message_likes (user_id, message_id)
VALUES (1, 1), (2, 1), (1, 4), (2, 5), (1, 7), (2, 7), (3, 7);