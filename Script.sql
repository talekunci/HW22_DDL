create table developers (
	id serial primary key,
	name varchar(50) not null,
	age integer,
	is_man boolean,
	description varchar(250)
);

create table skills (
	developer_id integer primary key,
	branch varchar(20) not null,
	skill_level varchar(20) not null,
	
	
	constraint developer_id_fk foreign key (developer_id) references developers(id)
);

create table companies (
	id serial primary key,
	company_name varchar(50) unique not null,
	description varchar(250)
);

create table projects (
	id serial primary key,
	project_name varchar(50) unique not null,
	description varchar(150)
);

create table customers (
	id serial primary key,
	customer_name varchar(50) unique not null,
	description varchar(250)
);

create table project_developers (
	id serial not null,
	developer_id integer not null,
	project_id integer primary key,
	
	constraint developer_id_fk foreign key (developer_id) references developers(id),
	constraint project_id_fk foreign key (project_id) references projects(id)
);

create table company_projects (
	id serial primary key,
	company_id integer not null,
	project_id integer unique not null,
	
	constraint company_id_fk foreign key (company_id) references companies(id),
	constraint project_id_fk foreign key (project_id) references projects(id)
);

create table developer_companies (
	id serial primary key,
	developer_id integer not null,
	company_id integer not null,
	
	constraint developer_id_fk foreign key (developer_id) references developers(id),
	constraint company_id_fk foreign key (company_id) references companies(id)
);

create table customers_projects (
	id serial primary key,
	customer_id integer not null,
	project_id integer unique not null,
	
	constraint customer_id_fk foreign key (customer_id) references customers(id),
	constraint project_id_fk foreign key (project_id) references projects(id)
);