--��������� �������������
insert into developers(name, age, gender) values ('Misha', 16, 'male');
insert into developers(name, age, gender) values ('Vera', 35, 'female');
insert into developers(name, age, gender) values ('Kolya', 56, 'male');
insert into developers(name, age, gender) values ('Anna', 12, 'female');


--��������� ������
insert into skills(branch, skill_level) values ('Java', 'Junior');
insert into skills(branch, skill_level) values ('Java', 'Middle');
insert into skills(branch, skill_level) values ('SQL', 'Junior');
insert into skills(branch, skill_level) values ('SQL', 'Middle');


--����������� ������ �������������
insert into developer_skills(developer_id, skill_id) values (1, 2);
insert into developer_skills(developer_id, skill_id) values (2, 1);
insert into developer_skills(developer_id, skill_id) values (3, 1);
insert into developer_skills(developer_id, skill_id) values (4, 2);
--��������� ������������ id = 4 ����� �� �������� � ������ ��������(������ ��� id)
insert into developer_skills(developer_id, skill_id) values (4, (select id from skills where branch = 'SQL' and skill_level = 'Junior'));


--��������� ��������
insert into companies(name) values ('GOOGLE');
insert into companies(name) values ('AMAZON');


--���������� ������������� �� ������
insert into developer_companies(developer_id, company_id) values((select id from developers where name = 'Anna'), (select id from companies where name = 'GOOGLE'));
insert into developer_companies(developer_id, company_id) values((select id from developers where name = 'Kolya'), (select id from companies where name = 'GOOGLE'));
insert into developer_companies(developer_id, company_id) values((select id from developers where name = 'Misha'), (select id from companies where name = 'AMAZON'));
insert into developer_companies(developer_id, company_id) values((select id from developers where name = 'Vera'), (select id from companies where name = 'AMAZON'));


--������� �������
--��� ������� |1 ������ = 1 �������� �����������|, � ��� ��������� �������� �������� ������
insert into projects(company_id, name) values((select id from companies where name = 'GOOGLE'), 'ARA');
insert into projects(company_id, name) values((select id from companies where name = 'AMAZON'), 'Kindle');
insert into projects(company_id, name) values((select id from companies where name = 'AMAZON'), 'Alexa');


--���������
insert into customers(name) values ('GOOGLE');
insert into customers(name) values ('People');


--������� ���������� �����������
insert into customers_projects(customer_id, project_id) values ((select id from customers where name = 'GOOGLE'), (select id from projects where name = 'ARA'));
insert into customers_projects(customer_id, project_id) values ((select id from customers where name = 'People'), (select id from projects where name = 'Kindle'));
insert into customers_projects(customer_id, project_id) values ((select id from customers where name = 'People'), (select id from projects where name = 'Alexa'));


--���� ������
insert into project_developers(developer_id, project_id) values ((select id from developers where name = 'Anna'), (select id from projects where name = 'ARA'));
insert into project_developers(developer_id, project_id) values ((select id from developers where name = 'Kolya'), (select id from projects where name = 'ARA'));
insert into project_developers(developer_id, project_id) values ((select id from developers where name = 'Misha'), (select id from projects where name = 'Alexa'));
insert into project_developers(developer_id, project_id) values ((select id from developers where name = 'Misha'), (select id from projects where name = 'Kindle'));
insert into project_developers(developer_id, project_id) values ((select id from developers where name = 'Vera'), (select id from projects where name = 'Alexa'));

