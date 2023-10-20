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
	    cno number(20) primary key,     -- 차량번호
	    c_name varchar2(50) unique,     -- 차량명
	    min_price number(20),           -- 최저가격
	    max_price number(20),           -- 최고가격
	    brand varchar2(20),             -- 브랜드
	    c_cover_img varchar2(100),      -- 표지사진
	    c_img varchar2(100),            -- 이미지
	    c_content varchar2(2000),       -- 차량 소개
	    c_kind varchar2(20),            -- 차량 종류
	    c_date date,                    -- 차량 출시일
	    engine varchar2(20),            -- 엔진 형식
	    gear varchar2(20),              -- 변속기 형식
	    displacement number,             -- 배기량
	    drive_type varchar2(20),        -- 구동방식
	    max_output varchar2(20),        -- 최고출력
	    suspention varchar2(60),        -- 서스펜션
	    torque varchar2(100),            -- 최대토크
	    brake varchar2(100),             -- 브레이크
	    accel varchar2(20),             -- 가속도
	    max_speed varchar2(20),         -- 최고속도
	    c_del char(1),                   -- 삭제여부
	    width number(20),                --너비
	    height number(20),               --높이
	    wheelbase number(20),            --휠베이스
	    length number(20),                --길이
	    formt_img varchar2(100),          --정면 이미지
	    side_img varchar2(100)            --옆면 이미지
	);

create sequence car_seq start with 1 increment by 1 maxvalue 999999;
select * from car;
drop table car;


--차량 추가
insert into car values(car_seq.nextval,'현대 쏘나타 (DN8)',2346,3590,'현대','Hyundai Sonata (DN8)cover.jpg','Hyundai Sonata (DN8).jpg','한국 대표 중형차 쏘나타. 코드명 DN8의 신형은 LF 후계차입니다. LF 디자인이 지나치게 보수적이라는 의견을 반영, 이번에는 한층 젊어진 게 특징이지요. 앞모습이 그 어떤 차에서도 본 적 없는 듯하고 뒤쪽 역시 새롭습니다(시빅을 좀 닮았지만). 아울러 새로운 3세대 플랫폼을 타고 나온 것도 신형의 강점입니다.
이번 DN8 쏘나타에 대한 반응을 보면 디자인과 성능에 대한 얘기가 많은 듯합니다. 우선 디자인은 호불호가 좀 갈리는 양상인데요. 이를테면 젊고 새로운 감각이라 마음에 든다는 쪽과 괴상하게 생겼다며 깎아내리는 의견으로 양분되는 듯합니다. 성능 면에서는 2.0L 자연흡기 엔진(160마력)과 6단 AT 조합이 너무 구닥다리 아니냐는 말이 있어요. 부정론이죠. 하지만 이는 1.6T(8단 AT)나 하이브리드를 선택하면 문제될 게 없습니다. 사실 SM6 프라임이나 말리부 1.35T도 잘만 굴러다니는 걸요 뭐. 오히려 2.0 자연흡기 엔진과 6단 AT는 높은 신뢰성으로 고전적인 국내 중형차 소비자들의 입맛에 적절할 것입니다. 그래서 주력 파워트레인인 거고요. 그게 싫으면 터보 버전 사면 되는 겁니다.
사실 쏘나타는 멋스러운 디자인이나 성능으로 타는 차가 아니죠. 무난함, 그리고 값 대비 풍요로운 공간으로써 제품력을 주도합니다. 이번 DN8 쏘나타 역시 그 가치를 잘 채우고 있습니다. 가령 편의장비가 그랜저를 추월할 정도로 풍성합니다. 능동 안전 기술이 전 등급에 기본이고 옵션으로 고속도로 주행 보조(HDA)까지 넣을 수 있어요. 전 등급에 에어백 9개가 기본인 것도 놀랍습니다. 특히 LPI 깡통(스마트) 버전은 운전대 열선과 운전석 전동 시트, 하이패스 같은 것들이 전부 기본이기도 합니다.','중형차',
TO_DATE('2019-03-01', 'YYYY-MM-DD'),'Smartstream G2.0','자동 6단',1999,'전륜','160 / 6,500','맥퍼슨 스트럿 ,멀티 링크',
'20 / 4,800','4개 / 벤틸레이티드 디스크 2개','9','241','n',1860,1445,2840,4900,'Hyundai Sonata (DN8)front.jpg','Hyundai Sonata (DN8)side.jpg');




create table design_img(
	dno number(20) primary key,
	img_name varchar2(100),
	cno number(20),
	foreign key(cno) references car(cno)
);
create sequence design_img_seq start with 1 increment by 1 maxvalue 999999;
select * from DESIGN_IMG;
drop table design_img;

create FUNCTION get_seq
RETURN NUMBER 
IS
BEGIN
 RETURN design_img_seq.nextval;
END;
/
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
    email varchar2(100),          -- 예약자 이메일
    r_tel varchar2(20),             -- 예약자 연락처
    r_date date,                    -- 예약일
    r_del char(1),                   -- 예약 취소여부    
    brand varchar2(20),				-- 예약 브랜드    
    r_model varchar2(50),           -- 예약 모델
    find_gu varchar2(20), 	        -- 예약 구
    find_city varchar2(20),         -- 예약 지역
    find_center varchar2(50),       -- 예약 매장

    foreign key(id) references member(id),
    foreign key(cno) references car(cno)
);

create sequence reservation_seq start with 1 increment by 1 maxvalue 999999;

select * from reservation;

drop table reservation;

-- 1:1 문의
create table help (
    hno number primary key,         -- 문의 번호
    id varchar2(20),                -- 아이디
    h_title varchar2(100),           -- 문의 제목
    h_content varchar2(1000),       -- 문의 내용
    h_fileName varchar2(100),        -- 문의 첨부 파일
    h_date date,                    -- 문의 날짜
    h_del char(1) ,                  -- 문의 삭제 여부
    foreign key(id) references member(id)
);
create sequence help_seq start with 1 increment by 1 maxvalue 999999;

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

-- 예약 전시장
create table center (
	num number(10),
	brand varchar2(20),
	find_gu varchar2(20),
	find_center varchar2(50) 
);
create sequence center_seq start with 1 increment by 1 maxvalue 999999;

drop sequence center_seq;

drop table center;

-- 기아
insert into center values (center_seq.nextval, '기아', '강남', '기아 압구정 지점');
insert into center values (center_seq.nextval, '기아', '강남', '기아 우리들대리점');
insert into center values (center_seq.nextval, '기아', '강남', '기아 대치지점');
insert into center values (center_seq.nextval, '기아', '강남', '기아 학동대리점');
insert into center values (center_seq.nextval, '기아', '강남', '기아 강남지점');

insert into center values (center_seq.nextval, '기아', '강서', '기아 강서플래그십스토어');
insert into center values (center_seq.nextval, '기아', '강서', '기아 마곡센트럴지점');
insert into center values (center_seq.nextval, '기아', '강서', '기아 발산대리점');
insert into center values (center_seq.nextval, '기아', '강서', '기아 양서대리점');
insert into center values (center_seq.nextval, '기아', '강서', '기아 신화대리점');

insert into center values (center_seq.nextval, '기아', '강북', '기아 강북지점');
insert into center values (center_seq.nextval, '기아', '강북', '기아 수유대리점');
insert into center values (center_seq.nextval, '기아', '강북', '기아 우이대리점');

insert into center values (center_seq.nextval, '기아', '강북', '기아 창동역대리점');
insert into center values (center_seq.nextval, '기아', '강북', '기아 쌍문대리점');

insert into center values (center_seq.nextval, '기아', '강동', '기아 강동지점');
insert into center values (center_seq.nextval, '기아', '강동', '기아 길동지점');
insert into center values (center_seq.nextval, '기아', '강동', '기아 명일대리점');
insert into center values (center_seq.nextval, '기아', '강동', '기아 영파대리점');
insert into center values (center_seq.nextval, '기아', '강동', '기아 고덕대리점');

-- 현대
insert into center values (center_seq.nextval, '현대', '강남', '현대자동차 대치지점');
insert into center values (center_seq.nextval, '현대', '강남', '현대자동차 강남청담지점');
insert into center values (center_seq.nextval, '현대', '강남', '현대자동차 도산대로지점');
insert into center values (center_seq.nextval, '현대', '강남', '현대자동차 강남대로지점');
insert into center values (center_seq.nextval, '현대', '강남', '현대자동차 구정대리점');

insert into center values (center_seq.nextval, '현대', '강서', '현대자동차 블루핸즈 등촌현대서비');
insert into center values (center_seq.nextval, '현대', '강서', '현대자동차 강서지점');
insert into center values (center_seq.nextval, '현대', '강서', '현대자동차 가양대리점');
insert into center values (center_seq.nextval, '현대', '강서', '현대자동차 마곡센트럴지점');
insert into center values (center_seq.nextval, '현대', '강서', '현대자동차 강서중부지점');

insert into center values (center_seq.nextval, '현대', '강북', '현대자동차 북부지점');
insert into center values (center_seq.nextval, '현대', '강북', '현대자동차 강북대리점');
insert into center values (center_seq.nextval, '현대', '강북', '현대자동차 강북중앙지점');
insert into center values (center_seq.nextval, '현대', '강북', '현대자동차 북서울숲대리점');
insert into center values (center_seq.nextval,'현대', '강북', '현대자동차 우이대리점');

insert into center values (center_seq.nextval, '현대', '강동', '현대자동차 올림픽지점');
insert into center values (center_seq.nextval, '현대', '강동', '현대자동차 성내지점');
insert into center values (center_seq.nextval, '현대', '강동', '현대자동차 길동대리점');
insert into center values (center_seq.nextval, '현대', '강동', '현대자동차 천호대리점');
insert into center values (center_seq.nextval, '현대', '강동', '현대자동차 고덕대리점');





