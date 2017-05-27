CREATE TABLE `proposals` (
    `id` VARCHAR(36) NOT NULL,
    `author_id` VARCHAR(36),
    `author_username` VARCHAR(100),
    `title` VARCHAR(100),
    `brief` VARCHAR(500),
    `source` VARCHAR(1000),
    `motivation` TEXT(20000),
    `measures` TEXT(20000),
    `status` VARCHAR(20),
    `due_date` TIMESTAMP NOT NULL DEFAULT 0,
    `expired` BOOLEAN NOT NULL DEFAULT 0,
    `favour` DOUBLE NOT NULL DEFAULT 0.0,
    `against` DOUBLE NOT NULL DEFAULT 0.0,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;


CREATE TABLE `comments` (
    `id` VARCHAR(36) NOT NULL,
    `proposal_id` VARCHAR(36) NOT NULL,
    `root_comment_id` VARCHAR(36) NOT NULL,
    `author_id` VARCHAR(36) NOT NULL,
    `author_username` VARCHAR(36) NOT NULL,
    `content` VARCHAR(3000),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;


CREATE TABLE `votes` (
    `comment_id` VARCHAR(36) NOT NULL,
    `voter_id` VARCHAR(36) NOT NULL,
    `option` VARCHAR(10) NOT NULL,
    PRIMARY KEY (comment_id , voter_id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

