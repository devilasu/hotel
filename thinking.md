reservation ���̺� �����ʿ�.

table roomtype(
	typecode
	name
)

table room(
	roomcode
	name
	type
	howmany
	howmuch
)

create table reservation(
	roomcode fk(room roomcode)
	startdate pk
	enddate
	mobile
);

create table member(
	name
	uid	pk
	password
);

