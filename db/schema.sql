create table customer (
    id int not null auto_increment primary key ,
    name VARCHAR(30) not null,
    email varchar(30) not null,
    pw varchar(30) not null,
    point int not null DEFAULT 0,
    ph int not null
);

create table coupon (
    id int not null auto_increment primary key,
    name varchar(30) not null,
    benefit int not null,
    period int not null
);

create table customer_coupon (
    id int not null auto_increment primary key,
    customer_id int not null,
    coupon_id int not null,
    registerday DATE,
    deadline DATE,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon (id)
);

create table movie (
    id int not null auto_increment primary key,
    title varchar(30) not null,
    img varchar(100) not null
);