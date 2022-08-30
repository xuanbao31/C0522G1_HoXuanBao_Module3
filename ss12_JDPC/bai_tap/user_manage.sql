CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');


-- DELIMITER //
-- create procedure get_user_by_id(IN user_id int)
-- begin
-- select users.name, users.email, users.country
-- from users
-- where users.id = user_id;
-- end //
-- DELIMITER ;


DELIMITER //
create procedure show_all()
begin
select * from users;
end //
DELIMITER ;
call show_all();

DELIMITER //
create procedure delete_user(in id_sp int)
begin
delete from users 
where id = id_sp;
end//
DELIMITER ;
call delete_user(5);


