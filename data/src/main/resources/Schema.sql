DROP SCHEMA IF EXISTS stockdata;
CREATE SCHEMA stockdata;
USE stockdata;

CREATE table symbol (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    ticker VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- The investment table is currently not used by this demo
CREATE table investment (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    symbol_id SMALLINT UNSIGNED NOT NULL,
    quantity INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (id),
	KEY idx_fk_symbol_id (symbol_id),
	CONSTRAINT `fk_symbol_id` FOREIGN KEY (symbol_id) REFERENCES symbol (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE table data_point (
    symbol_id SMALLINT UNSIGNED NOT NULL,
    time_stamp INT UNSIGNED NOT NULL,
    open INT UNSIGNED NOT NULL,
    close INT UNSIGNED NOT NULL,
    high INT UNSIGNED NOT NULL,
    low INT UNSIGNED NOT NULL,
    volume INT UNSIGNED NOT NULL,
    PRIMARY KEY (symbol_id, time_stamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;