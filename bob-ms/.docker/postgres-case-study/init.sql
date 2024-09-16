-- DROP SEQUENCE public.content_id_seq;

CREATE SEQUENCE public.content_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.course_id_seq;

CREATE SEQUENCE public.course_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.module_id_seq;

CREATE SEQUENCE public.module_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.roles_id_seq;

CREATE SEQUENCE public.roles_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.users_id_seq;

CREATE SEQUENCE public.users_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;-- public."content" definition

-- Drop table

-- DROP TABLE public."content";

CREATE TABLE public."content" (
	id bigserial NOT NULL,
	attachment varchar(255) NOT NULL,
	cover varchar(255) NOT NULL,
	created_at date NOT NULL,
	description varchar(255) NOT NULL,
	subtitle varchar(255) NOT NULL,
	title varchar(255) NOT NULL,
	updated_at date NOT NULL,
	video varchar(255) NOT NULL,
	CONSTRAINT content_pkey PRIMARY KEY (id)
);


-- public.course definition

-- Drop table

-- DROP TABLE public.course;

CREATE TABLE public.course (
	id bigserial NOT NULL,
	cover varchar(255) NOT NULL,
	description varchar(255) NOT NULL,
	CONSTRAINT course_pkey PRIMARY KEY (id)
);


-- public."module" definition

-- Drop table

-- DROP TABLE public."module";

CREATE TABLE public."module" (
	id bigserial NOT NULL,
	description varchar(255) NOT NULL,
	CONSTRAINT module_pkey PRIMARY KEY (id)
);


-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	id bigserial NOT NULL,
	"name" varchar(255) NULL,
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id bigserial NOT NULL,
	email varchar(255) NOT NULL,
	"name" varchar(255) NULL,
	"password" varchar(255) NOT NULL,
	username varchar(255) NOT NULL,
	CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email),
	CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username),
	CONSTRAINT users_pkey PRIMARY KEY (id)
);


-- public.course_module definition

-- Drop table

-- DROP TABLE public.course_module;

CREATE TABLE public.course_module (
	course_id int8 NOT NULL,
	module_id int8 NOT NULL,
	CONSTRAINT uk_fullme38tc71nag8axksajnwj UNIQUE (module_id),
	CONSTRAINT fkkge7sg0xxyo0sxgfelpavhjdj FOREIGN KEY (course_id) REFERENCES public.course(id),
	CONSTRAINT fknxpmkao1aniqf059wcl785y67 FOREIGN KEY (module_id) REFERENCES public."module"(id)
);


-- public.module_content definition

-- Drop table

-- DROP TABLE public.module_content;

CREATE TABLE public.module_content (
	module_id int8 NOT NULL,
	content_id int8 NOT NULL,
	CONSTRAINT uk_83f5k2p9qkda3qj1ae4iyp1op UNIQUE (content_id),
	CONSTRAINT fk8nmhu0nyvjj2sqyt76m9xcm2e FOREIGN KEY (module_id) REFERENCES public."module"(id),
	CONSTRAINT fkb9tw93qmq4escwnfsvqvu5pw9 FOREIGN KEY (content_id) REFERENCES public."content"(id)
);


-- public.users_roles definition

-- Drop table

-- DROP TABLE public.users_roles;

CREATE TABLE public.users_roles (
	user_id int8 NOT NULL,
	roles_id int8 NOT NULL,
	CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, roles_id),
	CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id),
	CONSTRAINT fka62j07k5mhgifpp955h37ponj FOREIGN KEY (roles_id) REFERENCES public.roles(id)
);

insert into roles (name) values ('USER');
insert into roles (name) values ('ADMIN');

insert into users (email, name, password, username) values ('test@mail.com', 'Test', '$2a$12$MIOta4TsmAYOA3b.YP1QYOJPU35KBWOA1jJLQhdeYEK0ksSZLZe/S', 'test@mail.com');

insert into users_roles (user_id, roles_id) values (1, 1);

insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/uploads/20240104114808/Free-JavaScript-Courses.jpg', 'Javascript Course');

insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230305131111/Java-programming.png', 'Java Course');

