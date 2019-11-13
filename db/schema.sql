create table customer (
    id int not null auto_increment primary key ,
    email varchar(30) not null,
    pw varchar(30) not null
);

create table movie (
    id int not null auto_increment primary key,
    title varchar(30) not null,
    img varchar(100) not null
);