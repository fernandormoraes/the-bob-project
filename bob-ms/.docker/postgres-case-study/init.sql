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

INSERT INTO "module" (description) VALUES ('Introduction to Javascript');
INSERT INTO "module" (description) VALUES ('Introduction to Java');

insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/uploads/20240104114808/Free-JavaScript-Courses.jpg', 'Javascript Course');

insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230305131111/Java-programming.png', 'Java Course');

INSERT INTO course_module (course_id, module_id) VALUES (1, 1);
INSERT INTO course_module (course_id, module_id) VALUES (2, 2);

INSERT INTO content (
    attachment,
    cover,
    created_at,
    description,
    subtitle,
    title,
    updated_at,
    video
)
VALUES (
    'attachment-js.pdf',
    'https://example.com/js-cover.png',
    CURRENT_DATE,
    'Introduction to JavaScript',
    'Getting Started',
    'JS Intro Lesson',
    CURRENT_DATE,
    'https://www.youtube.com/watch?v=hNSVVRQ1bmE'
);

INSERT INTO content (
    attachment,
    cover,
    created_at,
    description,
    subtitle,
    title,
    updated_at,
    video
)
VALUES (
    'attachment-js.pdf',
    'https://example.com/js-cover.png',
    CURRENT_DATE,
    'Introduction to Java',
    'Getting Started',
    'Java Intro Lesson',
    CURRENT_DATE,
    'https://www.youtube.com/watch?v=hNSVVRQ1bmE'
);

INSERT INTO module_content (module_id, content_id) VALUES (1, 1);
INSERT INTO module_content (module_id, content_id) VALUES (2, 2);


/* =========================================================
   NOVOS MÓDULOS
   ========================================================= */

INSERT INTO "module" (description) VALUES ('JavaScript Basics');      -- id 3
INSERT INTO "module" (description) VALUES ('Advanced JavaScript');    -- id 4
INSERT INTO "module" (description) VALUES ('Java Fundamentals');      -- id 5
INSERT INTO "module" (description) VALUES ('Advanced Java');          -- id 6


/* =========================================================
   RELAÇÃO COURSE ⇄ MODULE
   ========================================================= */

INSERT INTO course_module (course_id, module_id) VALUES (1, 3);
INSERT INTO course_module (course_id, module_id) VALUES (1, 4);
INSERT INTO course_module (course_id, module_id) VALUES (2, 5);
INSERT INTO course_module (course_id, module_id) VALUES (2, 6);


/* =========================================================
   CONTEÚDOS — JAVASCRIPT
   ========================================================= */

/* Module 1 — Introduction to JavaScript (id 1) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('js-variables.pdf','https://img.youtube.com/vi/W6NZfCO5SIk/hqdefault.jpg',CURRENT_DATE,'JavaScript Variables','Basics','Variables',CURRENT_DATE,'https://www.youtube.com/watch?v=W6NZfCO5SIk'),
('js-functions.pdf','https://img.youtube.com/vi/PKwu15ldZ7k/hqdefault.jpg',CURRENT_DATE,'JavaScript Functions','Basics','Functions',CURRENT_DATE,'https://www.youtube.com/watch?v=PKwu15ldZ7k'),
('js-conditions.pdf','https://img.youtube.com/vi/IsG4Xd6LlsM/hqdefault.jpg',CURRENT_DATE,'JavaScript Conditions','Flow','If / Else',CURRENT_DATE,'https://www.youtube.com/watch?v=IsG4Xd6LlsM'),
('js-loops.pdf','https://img.youtube.com/vi/s9wW2PpJsmQ/hqdefault.jpg',CURRENT_DATE,'JavaScript Loops','Flow','Loops',CURRENT_DATE,'https://www.youtube.com/watch?v=s9wW2PpJsmQ');

INSERT INTO module_content (module_id, content_id) VALUES
(1, 3),(1, 4),(1, 5),(1, 6);


/* Module 3 — JavaScript Basics (id 3) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('js-arrays.pdf','https://img.youtube.com/vi/oigfaZ5ApsM/hqdefault.jpg',CURRENT_DATE,'JavaScript Arrays','Core','Arrays',CURRENT_DATE,'https://www.youtube.com/watch?v=oigfaZ5ApsM'),
('js-objects.pdf','https://img.youtube.com/vi/PFmuCDHHpwk/hqdefault.jpg',CURRENT_DATE,'JavaScript Objects','Core','Objects',CURRENT_DATE,'https://www.youtube.com/watch?v=PFmuCDHHpwk'),
('js-dom.pdf','https://img.youtube.com/vi/0ik6X4DJKCc/hqdefault.jpg',CURRENT_DATE,'DOM Manipulation','Browser','DOM',CURRENT_DATE,'https://www.youtube.com/watch?v=0ik6X4DJKCc'),
('js-events.pdf','https://img.youtube.com/vi/YiOlaiscqDY/hqdefault.jpg',CURRENT_DATE,'JavaScript Events','Browser','Events',CURRENT_DATE,'https://www.youtube.com/watch?v=YiOlaiscqDY'),
('js-fetch.pdf','https://img.youtube.com/vi/cuEtnrL9-H0/hqdefault.jpg',CURRENT_DATE,'Fetch API','Async','Fetch',CURRENT_DATE,'https://www.youtube.com/watch?v=cuEtnrL9-H0');

INSERT INTO module_content (module_id, content_id) VALUES
(3, 7),(3, 8),(3, 9),(3, 10),(3, 11);


/* Module 4 — Advanced JavaScript (id 4) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('js-async.pdf','https://img.youtube.com/vi/V_Kr9OSfDeU/hqdefault.jpg',CURRENT_DATE,'Async JavaScript','Advanced','Async / Await',CURRENT_DATE,'https://www.youtube.com/watch?v=V_Kr9OSfDeU'),
('js-promises.pdf','https://img.youtube.com/vi/DHvZLI7Db8E/hqdefault.jpg',CURRENT_DATE,'JavaScript Promises','Advanced','Promises',CURRENT_DATE,'https://www.youtube.com/watch?v=DHvZLI7Db8E'),
('js-closures.pdf','https://img.youtube.com/vi/1JsJx1x35c0/hqdefault.jpg',CURRENT_DATE,'Closures','Advanced','Closures',CURRENT_DATE,'https://www.youtube.com/watch?v=1JsJx1x35c0'),
('js-modules.pdf','https://img.youtube.com/vi/cRHQNNcYf6s/hqdefault.jpg',CURRENT_DATE,'ES Modules','Advanced','Modules',CURRENT_DATE,'https://www.youtube.com/watch?v=cRHQNNcYf6s'),
('js-performance.pdf','https://img.youtube.com/vi/Z5n7PXB9O8I/hqdefault.jpg',CURRENT_DATE,'Performance','Advanced','Optimization',CURRENT_DATE,'https://www.youtube.com/watch?v=Z5n7PXB9O8I');

INSERT INTO module_content (module_id, content_id) VALUES
(4, 12),(4, 13),(4, 14),(4, 15),(4, 16);


/* =========================================================
   CONTEÚDOS — JAVA
   ========================================================= */

/* Module 2 — Introduction to Java (id 2) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('java-variables.pdf','https://img.youtube.com/vi/grEKMHGYyns/hqdefault.jpg',CURRENT_DATE,'Java Variables','Basics','Variables',CURRENT_DATE,'https://www.youtube.com/watch?v=grEKMHGYyns'),
('java-methods.pdf','https://img.youtube.com/vi/7WiJGTPuVeU/hqdefault.jpg',CURRENT_DATE,'Java Methods','Basics','Methods',CURRENT_DATE,'https://www.youtube.com/watch?v=7WiJGTPuVeU'),
('java-flow.pdf','https://img.youtube.com/vi/ldYLYRNaucM/hqdefault.jpg',CURRENT_DATE,'Control Flow','Flow','If / Switch',CURRENT_DATE,'https://www.youtube.com/watch?v=ldYLYRNaucM'),
('java-loops.pdf','https://img.youtube.com/vi/6i7h0hZNPtM/hqdefault.jpg',CURRENT_DATE,'Java Loops','Flow','Loops',CURRENT_DATE,'https://www.youtube.com/watch?v=6i7h0hZNPtM');

INSERT INTO module_content (module_id, content_id) VALUES
(2, 17),(2, 18),(2, 19),(2, 20);


/* Module 5 — Java Fundamentals (id 5) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('java-oop.pdf','https://img.youtube.com/vi/6T_HgnjoYwM/hqdefault.jpg',CURRENT_DATE,'Classes and Objects','OOP','Classes',CURRENT_DATE,'https://www.youtube.com/watch?v=6T_HgnjoYwM'),
('java-inheritance.pdf','https://img.youtube.com/vi/8s9I1G4tXhA/hqdefault.jpg',CURRENT_DATE,'Inheritance','OOP','Inheritance',CURRENT_DATE,'https://www.youtube.com/watch?v=8s9I1G4tXhA'),
('java-interfaces.pdf','https://img.youtube.com/vi/kdQf6pwpdcE/hqdefault.jpg',CURRENT_DATE,'Interfaces','OOP','Interfaces',CURRENT_DATE,'https://www.youtube.com/watch?v=kdQf6pwpdcE'),
('java-collections.pdf','https://img.youtube.com/vi/viTHc_4XfCA/hqdefault.jpg',CURRENT_DATE,'Collections Framework','Core','Collections',CURRENT_DATE,'https://www.youtube.com/watch?v=viTHc_4XfCA'),
('java-exceptions.pdf','https://img.youtube.com/vi/1XAfapkBQjk/hqdefault.jpg',CURRENT_DATE,'Exception Handling','Core','Exceptions',CURRENT_DATE,'https://www.youtube.com/watch?v=1XAfapkBQjk');

INSERT INTO module_content (module_id, content_id) VALUES
(5, 21),(5, 22),(5, 23),(5, 24),(5, 25);


/* Module 6 — Advanced Java (id 6) */
INSERT INTO content (attachment, cover, created_at, description, subtitle, title, updated_at, video) VALUES
('java-streams.pdf','https://img.youtube.com/vi/t1-YZ6bF-g0/hqdefault.jpg',CURRENT_DATE,'Streams API','Advanced','Streams',CURRENT_DATE,'https://www.youtube.com/watch?v=t1-YZ6bF-g0'),
('java-threads.pdf','https://img.youtube.com/vi/Ws7l9xF4kHk/hqdefault.jpg',CURRENT_DATE,'Multithreading','Advanced','Threads',CURRENT_DATE,'https://www.youtube.com/watch?v=Ws7l9xF4kHk'),
('java-jvm.pdf','https://img.youtube.com/vi/ZBJ0u9MaKtM/hqdefault.jpg',CURRENT_DATE,'JVM Internals','Advanced','JVM',CURRENT_DATE,'https://www.youtube.com/watch?v=ZBJ0u9MaKtM'),
('java-spring.pdf','https://img.youtube.com/vi/9SGDpanrc8U/hqdefault.jpg',CURRENT_DATE,'Spring Boot','Advanced','Spring',CURRENT_DATE,'https://www.youtube.com/watch?v=9SGDpanrc8U'),
('java-performance.pdf','https://img.youtube.com/vi/_i6k7J0Ggyc/hqdefault.jpg',CURRENT_DATE,'Performance Tuning','Advanced','Optimization',CURRENT_DATE,'https://www.youtube.com/watch?v=_i6k7J0Ggyc');

INSERT INTO module_content (module_id, content_id) VALUES
(6, 26),(6, 27),(6, 28),(6, 29),(6, 30);
