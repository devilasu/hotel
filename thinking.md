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

�Ⱓ ������ ���Ͽ�

���۽ð��� �� �ð��� �����Ѵٰ� �Ҷ�,
���ο� ��� ��, �װ��� ��ġ���� �Ȱ�ġ���� Ȯ���ϴ� ���.
����Ŭ ��� ����: connect by, to_date, trunc
�ǹ���: add_months?