BEGIN TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS breweries CASCADE;
DROP TABLE IF EXISTS beers CASCADE;
DROP TABLE IF EXISTS beer_type CASCADE;
DROP TABLE IF EXISTS beers_breweries CASCADE;
DROP TABLE IF EXISTS operations CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS requests CASCADE;
DROP TABLE IF EXISTS status CASCADE;
DROP TABLE IF EXISTS request_type CASCADE;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_brewery_id;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP SEQUENCE IF EXISTS seq_beer_type_id;
DROP SEQUENCE IF EXISTS seq_review_id;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  START WITH 1001
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_brewery_id
  START WITH 2001
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_beer_id
  INCREMENT BY 1
  START WITH 3001
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_beer_type_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_review_id
  START WITH 4001
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_request_id
  START WITH 5001
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');




CREATE TABLE breweries (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	brewery_name varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	city varchar(50) NOT NULL,
	state_name varchar(50) NOT NULL,
	zip_code varchar(10) NOT NULL,
	brewery_description varchar(1000) NOT NULL,
	brewer_id int NOT NULL,
	website varchar(255),
	phone_number varchar(15),
	brewery_photo varchar(255),
	is_approved BOOLEAN NOT NULL DEFAULT true,
	CONSTRAINT breweries_pk PRIMARY KEY (brewery_id)
);

CREATE TABLE beers (
	beer_id int DEFAULT nextval('seq_beer_id'::regclass) NOT NULL,
	beer_name varchar(255) NOT NULL,
	beer_description varchar(500) NOT NULL,
	beer_type_id int NOT NULL,
	abv DECIMAL NOT NULL,
	ibu int,
	beer_photo varchar(255) NOT NULL,
	CONSTRAINT beers_pk PRIMARY KEY (beer_id)
);

CREATE TABLE beer_type (
	beer_type_id int DEFAULT nextval('seq_beer_type_id'::regclass) NOT NULL,
	beer_type_name varchar(255) NOT NULL,
	CONSTRAINT beer_type_pk PRIMARY KEY (beer_type_id)
);


CREATE TABLE beers_breweries (
	beer_id bigint NOT NULL,
	brewery_id bigint NOT NULL,
	CONSTRAINT beers_breweries_pk PRIMARY KEY (beer_id)
);

CREATE TABLE operations (
	day int NOT NULL,
	time_open TIME NOT NULL,
	time_closed TIME NOT NULL,
	brewery_id int NOT NULL
);

CREATE TABLE reviews (
        review_id int DEFAULT nextval('seq_review_id'::regclass) NOT NULL,
        beer_id int NOT NULL,
        user_id int NOT NULL,
        review_title varchar(100) NOT NULL,
        review_desc varchar(500) NOT NULL,
        stars int NOT NULL,
        CONSTRAINT reviews_pk PRIMARY KEY (review_id)   
);

CREATE TABLE requests (
	request_id int DEFAULT nextval('seq_request_id'::regclass) NOT NULL,
	user_id int NOT NULL,
	status_id int NOT NULL,
	type_id int NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT requests_pk PRIMARY KEY (request_id)
);

CREATE TABLE status (
	status_id serial NOT NULL,
	status_name varchar(100) NOT NULL,
	CONSTRAINT status_pk PRIMARY KEY (status_id)
);

CREATE TABLE request_type (
	type_id serial NOT NULL,
	type_name varchar(100) NOT NULL,
	CONSTRAINT request_type_pk PRIMARY KEY (type_id)
);

INSERT INTO status (status_name) VALUES ('pending'), ('approved'), ('rejected');
INSERT INTO request_type (type_name) VALUES ('add brewery');
INSERT INTO request_type (type_name) VALUES ('claim brewery');



ALTER TABLE breweries ADD CONSTRAINT breweries_fk_brewer_id FOREIGN KEY (brewer_id) REFERENCES users(user_id);
ALTER TABLE beers ADD CONSTRAINT beers_fk_beer_type_id FOREIGN KEY (beer_type_id) REFERENCES beer_type(beer_type_id);
ALTER TABLE beers_breweries ADD CONSTRAINT beers_breweries_fk_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id);
ALTER TABLE beers_breweries ADD CONSTRAINT beers_breweries_fk_brewery_id FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id);
ALTER TABLE operations ADD CONSTRAINT operations_fk_brewery_id FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id);
ALTER TABLE reviews ADD CONSTRAINT reviews_fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE reviews ADD CONSTRAINT reviews_fk_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id);
ALTER TABLE requests ADD CONSTRAINT requests_fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE requests ADD CONSTRAINT requests_fk_status_id FOREIGN KEY (status_id) REFERENCES status(status_id);
ALTER TABLE requests ADD CONSTRAINT requests_fk_type_id FOREIGN KEY (type_id) REFERENCES request_type(type_id);
ALTER TABLE requests ADD CONSTRAINT requests_fk_brewery_id FOREIGN KEY (brewery_id) REFERENCES breweries(brewery_id);

COMMIT TRANSACTION;























