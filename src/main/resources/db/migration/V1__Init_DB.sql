CREATE TABLE message (
    id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255) DEFAULT NULL,
    tag VARCHAR(255) DEFAULT NULL,
    text VARCHAR(2048) NOT NULL,
    user_id bigint
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE user_role (
    user_id bigint NOT NULL,
    roles VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE usr (
    id bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    activation_code VARCHAR(255) DEFAULT NULL,
    active bit NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE message
    ADD CONSTRAINT message_user_fk
    FOREIGN KEY (user_id) REFERENCES usr (id);

ALTER TABLE user_role
    ADD CONSTRAINT user_role_fk
    FOREIGN KEY (user_id) REFERENCES usr (id);