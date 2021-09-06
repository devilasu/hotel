reservation 테이블 생성필요.

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

기간 관리에 대하여

시작시간과 끝 시간을 저장한다고 할때,
새로운 등록 시, 그것이 겹치는지 안겹치는지 확인하는 방법.
오라클 사용 쿼리: connect by, to_date, trunc
의문점: add_months?