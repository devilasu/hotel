create table roomtype(
    typecode number(2) primary key,
    name varchar2(20)
);
create table room(
    roomcode number(2) primary key,
    name varchar2(20),
    type number(2),
    howmany number(2),
    hownuch number(6),
    constraint fk_tcode foreign key(type) references roomtype(typecode) on delete cascade
);
create table reservation(
    bookcode number primary key,
    startdate date,
    enddate date,
    howmanynum number(2),
    mobile varchar2(32),
    roomcode number(2),
    constraint fk_rcode foreign key(roomcode) references room(roomcode) on delete cascade
);
create table member(
    id varchar2(20) primary key,
    name varchar2(20),
    password varchar2(20)
);

alter table room rename column typecode to type;
create sequence seq_bookcode
increment by 1
start with 1;
alter table reservation rename column howmanynum to howmany;
alter table room modify howmuch number(10,0);