
create table users
(
    id int primary key auto_increment,
    username varchar(20) not null,
    password int not null
);

create table profile
(
    id int primary key auto_increment,
    name varchar(20) not null,
    surname varchar(20) not null,
    age int not null,
    user_id int not null unique ,
    foreign key (user_id) references users(id)
);

select * from users
                  join profile p on users.id = p.user_id;

create table users_cars
(
    car_id bigint,
    user_id int,
    primary key (car_id, user_id),
    foreign key (car_id) references cars(id),
    foreign key (user_id) references users(id)
);

select users.* from users
                        join users_cars uc on users.id = uc.user_id
where car_id=40;
