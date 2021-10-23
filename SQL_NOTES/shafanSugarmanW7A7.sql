-- This db is used for keycard assignments.
CREATE SCHEMA keycard_db;

DROP TABLE if exists keycard_db.keycard_users;

CREATE TABLE keycard_db.keycard_users (
	user_id int auto_increment NOT NULL,
    user_name varchar(100) NOT NULL,
    constraint user_id_pk
    PRIMARY KEY (user_id)
);

DROP TABLE if exists keycard_db.keycard_groups;

CREATE TABLE keycard_db.keycard_groups (
	group_id int auto_increment NOT NULL,
    group_name varchar(100) NOT NULL,
    constraint group_id_pk
    PRIMARY KEY (group_id)
);

DROP TABLE if exists keycard_db.keycard_rooms;

CREATE TABLE keycard_db.keycard_rooms (
	room_id int auto_increment NOT NULL,
    room_name varchar(100) NOT NULL,
    constraint room_id_pk
    PRIMARY KEY (room_id)
);

CREATE TABLE IF NOT EXISTS keycard_db.usersgroups (
	user_id int NULL,
    user_name varchar(100) NULL,
	group_id int NULL,
	group_name varchar(100) NULL,
    enrolled int NULL,
    constraint user_id_fk
    foreign key (user_id)
    references keycard_db.keycard_users(user_id), 
    foreign key (group_id)
    references keycard_db.keycard_groups(group_id)
);

CREATE TABLE IF NOT EXISTS keycard_db.groupsrooms (
	group_id int NULL,
    group_name varchar(100) NULL,
	room_id int NULL,
    room_name varchar(100) NULL,
	enrolled BOOLEAN NULL,
	constraint group_id_fk
    foreign key (group_id)
    references keycard_db.keycard_groups(group_id), 
    foreign key (room_id)
    references keycard_db.keycard_rooms(room_id)
);

INSERT INTO keycard_db.keycard_users (user_name)
	VALUES
    ('Modesto'),
    ('Ayine'),
    ('Christopher'),
    ('Cheong Woo'),
    ('Saulat'),
    ('Heidy');

INSERT INTO `keycard_db`.`keycard_groups` (
    group_name)
    VALUES
    ('I.T.'),
    ('Sales'),
    ('Administration'),
    ('Operations');

INSERT INTO `keycard_db`.`keycard_rooms` (room_name)
	VALUES
    ('101'),
    ('102'),
    ('Auditorium A'),
    ('Auditorium B');
    
INSERT INTO `keycard_db`.`usersgroups` (user_id, user_name, group_id, group_name, enrolled)
	VALUES
    (1, 'Modesto', 1, 'I.T.', TRUE),
    (2, 'Ayine', 1, 'I.T.', TRUE),
    (3, 'Christopher', 2, 'Sales', TRUE),
    (4, 'Cheong Woo', 2, 'Sales', TRUE),
    (5, 'Saulat', 3, 'Administration', TRUE),
    (6, 'Heidy', NULL, NULL, FALSE);

INSERT INTO `keycard_db`.`groupsrooms` (group_id, group_name, room_id, room_name, enrolled)
	VALUES
    (1, 'I.T.', 1, '101', TRUE),
    (1, 'I.T.', 2, '102', TRUE),
    (2,'Sales', 2, '102', TRUE),
    (2, 'Sales', 3, 'Auditorium A', TRUE),
    (3,NULL, NULL, NULL, FALSE),
    (4,NULL, NULL, NULL, FALSE);


-- Question 1
select * from keycard_db.usersgroups;

-- Question 2
select * from keycard_db.groupsrooms;

-- Question 3, sorry I was too sick to finish this
-- select keycard_db.usersgroups.user_name, keycard_db.usersgroups.group_name, keycard_db.groupsrooms.room_name 
-- from keycard_db.uesrgroups t1
-- INNER JOIN keycard_db.groupsrooms t2
--	ON t1.group_id = t2.group_id;
