-- 권한 주기
create user teddy identified by 1234;
grand dba to teddy;

-- 회원
create table member (
    id varchar2(20) primary key,    -- 아이디
    password varchar2(100),          -- 비밀번호
    name varchar2(20),              -- 이름
    email varchar2(100),             -- 이메일
    gender varchar2(20),            -- 성별
    regdate date,                   -- 가입날짜
    fileName varchar2(100),           -- 프로필
    m_del char(1)                   -- 회원탈퇴여부
);

select * from member;

drop table member;


-- 차량
	create table car (
	    cno number(20) primary key,                     -- 차량번호
	    c_name varchar2(20),            -- 차량명
	    c_price number(20),                 -- 가격
	    brand varchar2(20),             -- 브랜드
	    c_cover_img varchar2(100),       -- 표지사진
	    c_img varchar2(100),            -- 이미지
	    c_content varchar2(2000),       -- 차량 소개
	    c_kind varchar2(20),            -- 차량 종류
	    c_date date,                    -- 차량 출시일
	    engine varchar2(20),            -- 엔진 형식
	    gear varchar2(20),              -- 변속기 형식
	    deplacement number,             -- 배기량
	    drive_type varchar2(20),        -- 구동방식
	    max_output varchar2(20),        -- 최고출력
	    suspention varchar2(20),        -- 서스펜션
	    torque varchar2(20),            -- 최대토크
	    brake varchar2(20),             -- 브레이크
	    accel varchar2(20),             -- 가속도
	    max_speed varchar2(20),         -- 최고속도
	    c_del char(1)                   -- 삭제여부
	);



create sequence car_seq start with 1 increment by 1 maxvalue 999999;
 

select * from car;
drop table car;

-- 게시판
create table board (
    bno number primary key,         -- 게시판 번호
    id varchar2(20),                -- 아이디
    b_title varchar2(20),           -- 게시글 번호
    b_writer varchar2(20),          -- 게시글 작성자
    b_content varchar2(1000),       -- 게시글 내용
    b_date date,                    -- 게시글 작성 날짜
    b_cnt number,                   -- 게시글 조회수
    b_del char(1),                   -- 게시글 삭제여부
    foreign key(id) references member(id)
);

select * from board;
drop table board;

-- 시승예약
create table reservation (
    rno number primary key,         -- 예약번호
    id varchar2(20),                -- 예약자 아이디
    cno number(20),                 -- 차량번호
    r_name varchar2(20),            -- 예약자 이름
    r_tel varchar2(20),             -- 예약자 연락처
    r_email varchar2(100),           -- 예약자 이메일
    r_model varchar2(20),           -- 예약 모델
    r_country varchar2(20),         -- 예약 지역
    r_center varchar2(20),          -- 예약 매장
    r_date date,                    -- 예약일
    r_del char(1),                   -- 예약 취소여부
    foreign key(id) references member(id),
    foreign key(cno) references car(cno)
);

select * from reservation;
drop table reservation;

-- 1:1 문의
create table help (
    hno number primary key,         -- 문의 번호
    id varchar2(20),                -- 아이디
    h_title varchar2(20),           -- 문의 제목
    h_content varchar2(1000),       -- 문의 내용
    h_fileName varchar2(100),        -- 문의 첨부 파일
    h_date date,                    -- 문의 날짜
    h_del char(1) ,                  -- 문의 삭제 여부
    foreign key(id) references member(id)
);

select * from help;
drop table help;

-- 평점
create table review (
    re_no number primary key,       -- 평점 번호
    id varchar2(20),                -- 작성자 아이디
    cno number(20),                 -- 차량번호
    re_content varchar2(500),       -- 평점 내용
    re_date date,                   -- 평점 날짜
    re_del char(1),                  -- 평점 삭제 여부
    foreign key(id) references member(id),
    foreign key(cno) references car(cno)
);

select * from review;
drop table review;

-- 뉴스
create table news (
    nno number primary key,         -- 뉴스 번호
    n_cover_img varchar2(100),      -- 표지 사진
    n_title varchar2(20),           -- 뉴스 제목
    n_content varchar2(1000),       -- 뉴스 내용
    n_writer varchar2(20),          -- 뉴스 작성자 (관리자)
    n_date date,                    -- 뉴스 작성일
    n_del char(1)                   -- 뉴스 삭제 여부
);

select * from news;
drop table news;

insert into car values(car_seq,'현대 그랜저 (GN7)',42330000,'현대','그랜저 타는 교사는 차 팔라 그래!” 1994년 우리나라 교육청이 내린 지침입니다. 놀랍지 않나요? 이유는 교사가 타기에 너무 사치스러운 차이기 때문이랍니다. 본디 그랜저는 이토록 화려한 자동차였습니다. 1986년 출시한 1세대(L)와 1992년 등장한 2세대(LX)는 대한민국 최고가 세단으로 군림했죠. 오늘날 제네시스 G90과 위상이 비슷한 셈입니다. 이후 3세대(XG)부터는 한층 합리적인 준대형 세단으로 자리매김해 지금까지 이어져 왔는데, 7세대(GN7)에 이르러 다시금 현대자동차 최고의 기함 다운 모습으로 돌아왔습니다.',
'대형차',)


