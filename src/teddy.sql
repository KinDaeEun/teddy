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
alter table member add member_auth number default 0;
select * from member;
drop table member;

create table MEMBER_AUTH(MEMBEREMAIL varchar2(100),AUTHKEY varchar2(50));
select * from car;



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

DROP TABLE car CASCADE CONSTRAINTS;


-- 차량 이미지
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

-- 칭찬 알림방
create table compliment(
	cpno number(20) primary key, --칭찬번호
	cp_content varchar2(1000),  --칭찬내용
	cp_date date,  --칭찬 등록일
	cp_del char(1), --삭제여부
	id varchar2(20) references member(id) --등록한 id
);
drop sequence compliment_seq;
drop table compliment;
select * from compliment;
create sequence compliment_seq start with 1 increment by 1 maxvalue 999999;

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
create sequence board_seq start with 1 increment by 1 maxvalue 999999;
select * from board;
drop table board;
drop sequence board_seq;

-- 공지사항
create table notice (
    nno number primary key,         -- 공지사항 번호
    id varchar2(20),                -- 아이디
   	n_title varchar2(100),           -- 공지사항 제목
    n_content varchar2(1000),       -- 공지사항 내용
    n_date date,                    -- 공지사항 작성 날짜
    n_cnt number(20),                   -- 공지사항 조회수
    n_del char(1),                   -- 공지사항 삭제여부
    foreign key(id) references member(id)
);
create sequence notice_seq start with 1 increment by 1 maxvalue 999999;
select * from notice;
drop table notice;
drop sequence notice_seq;

-- 시승예약
create table reservation (
    rno number primary key,         -- 예약번호
    id varchar2(20),                -- 예약자 아이디
    r_name varchar2(20),            -- 예약자 이름
    email varchar2(100),          -- 예약자 이메일
    r_tel varchar2(20),             -- 예약자 연락처
    r_date date,                    -- 예약일
    r_del char(1),                   -- 예약 취소여부    
    brand varchar2(20),				-- 예약 브랜드    
    c_name varchar2(50),           -- 예약 모델
    find_city varchar2(20),         -- 예약 지역
    find_gu varchar2(20), 	        -- 예약 구
    find_center varchar2(50),       -- 예약 매장

    foreign key(id) references member(id)
);

create sequence reservation_seq start with 1 increment by 1 maxvalue 999999;
select * from reservation;
drop table reservation;
drop sequence reservation_seq;


-- 1:1 문의
create table help (
    hno number primary key,         -- 문의 번호
    id varchar2(20),                -- 아이디
    h_title varchar2(100),           -- 문의 제목
    h_content varchar2(1000),       -- 문의 내용
    h_fileName varchar2(100),        -- 문의 첨부 파일
    h_date date,                    -- 문의 날짜
    h_del char(1),                  -- 문의 삭제 여부
    h_ref varchar2(50),              -- 답변여부
    r_content varchar2(1000),       -- 답변 내용
    foreign key(id) references member(id)
);
create sequence help_seq start with 1 increment by 1 maxvalue 999999;
select * from help;
drop table help;
drop sequence help_seq;

-- 평점
create table review (
    re_no number primary key,       -- 평점 번호
    id varchar2(20),                -- 작성자 아이디
    cno number(20),                 -- 차량번호
    rating number(20),				-- 별점
    re_content varchar2(500),       -- 평점 내용
    re_date date,                   -- 평점 날짜
    re_del char(1),                  -- 평점 삭제 여부
    foreign key(id) references member(id),
    foreign key(cno) references car(cno)
);
create sequence review_seq start with 1 increment by 1 maxvalue 999999;

select * from review;
drop table review;
drop sequence review_seq;

-- 뉴스
create table news (
    nno number primary key,         -- 뉴스 번호
    n_cover_img varchar2(100),      -- 표지 사진
    n_img varchar2(20),
    n_title varchar2(100),           -- 뉴스 제목
    n_content varchar2(3000),       -- 뉴스 내용
    n_writer varchar2(20),          -- 뉴스 작성자 (관리자)
    n_date date,                    -- 뉴스 작성일
    n_del char(1)                   -- 뉴스 삭제 여부
);
create sequence news_seq start with 1 increment by 1 maxvalue 999999;
select * from news;
drop table news;
drop sequence news_seq;


-- 예약 전시장
create table center (
	num number(10) primary key,
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



select * from review;
-- 뉴스 데이터


insert into news values( 
	news_seq.nextval,
	'n2.jpg',
	'n2-1.jpg',
	'기아 EV9 (6인승)시승기 ? 좋긴 한데, 한번만 더 생각해보자',
	'EV9 은 분명 매력적인 상품성을 갖고 있다. 그런데, 큰 전기 SUV 를 찾는 사람들에게는 꽤 괜찮은 선택이 되겠지만, 과격한 드라이빙 습관이 좀 있다면, 이 차는 롤이 있는 편이어서 어울리지 않는다. 그리고 크고 무거워지면서 배터리 용량이 커졌어도 아이오닉5와 비교해 주행가능거리는 큰 차이가 나지 않는다.
		EV9 을 보고 전기차의 목적에 대한 생각을 다시 하게 되었다. 분명 시장에서 요구를 하니깐 대형 전기 SUV 를 만든 것이겠지만, 탄소중립을 위한 전기차가 목적이라면 소형 전기차가 그 목적을 달성하는데 더 큰 도움이 될 수 있다. 큰 배터리로 충전시간도 더 늘어났고, 차가 무거워졌다. 소형 전기차에 적당한 사이즈의 전기차라면 가벼워 충분히 여유로운 주행거리를 보일 수 있는데, 배터리 자원을 더 많이 쓰게 된다는 점에서 친환경차를 위한 전기차라기보다는, 상품성을 위한 전기차라는 생각이 더 많이 들게 된다.
		분명 EV9 은 모던하고 굵직한 실내외 디자인과 다양한 공간 연출이 가능한 구성 및 각종 편의사양과 하이테크 및 안전사양들은 매력적으로 상품성이 좋다. 하지만, 큰 전기차로 무엇을 할지 한번 잘 생각해보고, 전기차를 선택하는 이유가 무엇인지도 한번 더 생각해보길 바란다. 목적에 맞다면 EV9 은 좋은 차다.',
	'테디',
	sysdate,
	'n'
	);
insert into news values( 
	news_seq.nextval,
	'n1.jpg',
	'n1-1.jpg',
	'제네시스 GV80 쿠페, 마케팅으로써의 디자인',
	'현대자동차에서 제네시스가 브랜드로 분리된 건 2015년이었다. 대략 8년의 시간이 흘렀다. 제네시스는 짧은 기간만에 자사만의 확고한 브랜드 아이덴티티를 구축한 바 있다. 제네시스의 엠블럼을 형상화한 크레스트 그릴, 그리고 날개를 형상화한 두 줄 캐릭터가 그 예시이다. 그러한 투-라인 룩을 정립한 차종이 초기형 GV80이었다. 그 앞에 G70의 두 줄 DRL이나 EQ900의 페이스리프트로 출시한 G90도 제네시스의 디자인 방향성을 제시하고는 했다. 하지만 시작부터 철저히 제네시스 브랜드만의 디자인 언어로 설계된 차종은 GV80이 최초였다는 의미다.
		GV80에서 전달하고자 하는 디자인 언어는 역동적인 우아함이라고 했다. 그리고 역동성과 우아함을 묘사할 수 있는 여러 픽션을 묘사했다. 헤드램프의 단정하고 간결한 그래픽, 굵은 몰딩을 지닌 범퍼와 크레스트 그릴, 플래그 타입으로 거치된 사이드미러 등 우아함을 자극할 수 있는 디테일들은 많다. 여기서 역동성을 표현하는 부분은 차체 전반에 거친 윤곽선과 비율 감각이다. 길게 뻗어있는 보닛이나 차체 뒤편으로 갈수록 낮아지는 캐릭터 라인, 앞뒤 휠 아치를 강조하는 차체 굴곡이 좋은 예시다. 제네시스는 각각의 라인에 파라볼릭 라인, 애슬레틱 파워 라인 이라는 설명을 덧붙인다.
		제네시스가 양산차량에 할 수 있는 최선을 담은 모델이다. 쿠페라는 점에서 실용성이 아닌 멋을 따져보는게 합리적인 시각이 된다. 반대로 말하면 제네시스의 멋을 가감없이 소비자들에게 전달할 수 있는 수단이라는 것이다. 판매량과 수익성도 물론 중요하겠지만, GV80이 쿠페로서 보여줘야 하는 성과가 금전적 가치만이 되어서는 안 된다. 많은 사람들이 GV80 쿠페를 접함으로써 브랜드에 대한 인식이 뒤바뀔 수 있다면 된다. 그 존재만으로 성과가 되는 것이다. 사변적으로 GV80 쿠페의 디자인은 멋있다. 하지만 명맥을 이어나가야 한다. 제네시스의 일회성 퍼포먼스로 마무리되지 않기를 기대해 본다.',
	'테디',
	sysdate,
	'n'
	);
insert into news values( 
	news_seq.nextval,
	'n3.jpg',
	'n3-1.jpg',
	'기아 EV3,EV4,EV5 포토 공개',
	'기아는 이날 세계 최초로 EV4 콘셉트와 EV3 콘셉트를 공개하며 기아 전기차 라인업에 새롭게 추가될 모델을 예고했다.
	기아글로벌디자인센터 카림 하비브 부사장은 “기아는 EV9과 EV6를 비롯해 EV5, EV4 콘셉트, EV3 콘셉트의 디자인을 통해 새로운 세대의 고객에게 더욱 의미있고 더 나은 방향의 경험과 가치를 제공할 것을 약속하고 있다”고 밝혔다.
	EV4 콘셉트는 오퍼짓 유나이티드의 ‘미래를 향한 혁신적 시도(Power to Progress)’를 주제로 세단에 대한 고정관념을 깨고 기아가 추구하는 차세대 전동화 세단의 방향성을 보여준다.
	전면부는 낮은 후드 형상을 강조하는 넓고 당당한 자세가 담대한 인상을 나타내며 기하학적 조화를 이룬 세부 디자인 요소와 패턴, 스타맵 시그니처 라이팅을 적용해 기술적으로 완성도 높은 느낌을 연출했다.
	측면부는 롱-테일(Long-tail) 이미지를 구현하는 데크(Deck, 리어 글라스에서 트렁크 끝단까지 이어지는 부분)가 낮게 떨어지는 후드 끝단과 함께 새로운 유형의 실루엣을 연출한다.
	후면부는 기존 세단에서 볼 수 없었던 독창적인 형상의 루프 스포일러와 수직 방향의 테일램프로 테일게이트의 넓은 폭과 깔끔한 면을 강조한다.
	EV4 콘셉트의 실내는 깔끔하고 넓은 수평형 구조를 바탕으로 세련된 디자인 요소를 운전자의 시야가 방해되지 않도록 적용해 운전자 지향적인 공간을 갖췄다.
	이를 위해 미사용 시 센터페시아에 수납할 수 있는 공조 조작 패널을 배치하고, 패턴을 바꿀 수 있는 핀(Pin) 스타일 에어벤트를 적용하는 등 실내 디자인 요소를 다듬었다.
	또한 지속가능성을 고려, 대지(Earth)의 요소에서 영감을 받아 100% 재활용된 면사에 호두껍질 등을 천연 염료로 사용해 실내에 다양한 색상을 구현했다.
	EV3 콘셉트는 강인하고 기하학적으로 조화를 이룬 차체에 역동적인 루프라인으로 ‘이유 있는 즐거운 경험(Joy for Reason)’을 잘 표현한 실루엣을 갖췄다.',
	'테디',
	sysdate,
	'n'
	);
insert into news values( 
	news_seq.nextval,
	'n4.jpg',
	'n4-1.jpg',
	'링컨코리아, 올-뉴 링컨 노틸러스 (All-New Lincoln Nautilus) 사전 계약 시작',
	'2023년 11월 1일 ? 링컨세일즈서비스코리아(대표 데이비드 제프리, 이하 링컨코리아)는 링컨의 대표 중형 SUV 올-뉴 링컨 노틸러스(All-New Lincoln Nautilus)의 국내 출시를 앞두고 오늘부터 사전 계약을 시작한다.
	링컨코리아는 올-뉴 링컨 노틸러스를 통해 안식처라는 공간의 개념을 재정립하고, 그동안 경험하지 못한 새로운 디지털 고객 경험(New Digital Customer Experience)을 제공해 브랜드의 핵심 가치인 ‘궁극의 편안함(Power of Sanctuary)’을 실현한다.
	이번 노틸러스는 새로워진 외관 및 내관 디자인을 통해 확 달라진 모습으로 출시된다. 브랜드 시그니처인 수평적 디자인 요소를 적용하여 탑승자가 선박의 선장이 된 것처럼 느낄 수 있도록 설계되었다. 또한 새롭게 탑재된 링컨 리쥬브네이트(Lincoln Rejuvenate)로 탑승자의 다양한 감각을 충족시키고, 이는 몰입형 경험으로 이어져 자신만의 안식처를 누릴 수 있도록 했다.
	한편, 링컨 노틸러스는 2016년 국내 출시 후 안목 높은 프리미엄 자동차 고객들로부터 사랑받아 온 2세대 링컨 MKX의 페이스리프트 모델이다. 1세대 노틸러스는 2017년 국내에 처음 공개되어 이후 2019년에 정식 출시되었으며, 헤리티지와 첨단 사양이 조화를 이루는 모델로 평가받았다. 노틸러스는 ‘탐험’을 뜻하는 라틴어에서 유래하였으며, 이는 링컨이 지향하는 브랜드 전략과 방향성을 담아내고 있다.
	올-뉴 링컨 노틸러스의 가격은 7,740만 원(부가세 포함, 개별소비세 5.0% 적용)이다. 자세한 내용은 링컨코리아 공식 딜러사 전시장, 링컨코리아 홈페이지 및 고객센터 문의를 통해 확인할 수 있다.',
	'테디',
	sysdate,
	'n'
	);
insert into news values( 
	news_seq.nextval,
	'n5.jpg',
	'n5-1.jpg',
	'MINI 코리아, ‘MINI 컨트리맨 하이랜드 에디션’ 온라인 한정 판매',
	'프리미엄 소형차 브랜드 MINI 코리아가 11월 1일 오후 3시, MINI 샵 온라인(https://shop.mini.co.kr)을 통해 ‘MINI 컨트리맨 하이랜드 에디션’을 한정 판매한다.
	뉴 MINI 컨트리맨을 기반으로 제작된 MINI 컨트리맨 하이랜드 에디션(MINI Countryman Highlands Edition)은 전설과 신화로 잘 알려진 스코틀랜드의 하이랜드(Highlands)에서 영감을 얻은 한정 에디션이다. MINI 컨트리맨 특유의 선구적 모험 정신을 강조한 디자인이 특징이다.
	MINI 컨트리맨 하이랜드 에디션은 쿠퍼 및 쿠퍼 S 총 2가지 사양으로 출시된다. 먼저 쿠퍼 모델에는 MINI 컨트리맨 최초로 에니그매틱 블랙(Enigmatic Black) 외장 색상을 적용해 희소가치를 더했다. 엔진룸에는 최고출력 136마력, 최대토크 22.4kg·m를 발휘하는 MINI 트윈파워 터보 3기통 가솔린 엔진이 탑재되며 18인치 페어 스포크 경량 알로이 휠이 장착된다.
	쿠퍼 S 모델의 외장에는 인기 색상인 나누크 화이트(Nanuq White)가 적용됐다. 엔진룸에는 최고출력 192마력, 최대토크 28.6kg·m를 발휘하는 MINI 트윈파워 터보 4기통 가솔린 엔진이 탑재되며 18인치 핀 스포크 블랙 경량 알로이 휠이 장착된다.
	더불어 사이드 스커틀, 도어 실 등에는 스코틀랜드 하이랜드의 지형 실루엣을 나타내는 전용 패턴과 하이랜드 레터링을 적용했다. 트렁크 데칼에도 하이랜드 레터링을 새겨 넣었으며, 에디션 전용 휠 캡 등을 적용해 한정판만의 특별한 매력을 발산한다.
	실내에는 쿠퍼 모델의 경우 몰트 브라운 색상의 가죽 스포츠 시트를, 쿠퍼 S 모델에는 카본 블랙 색상의 MINI 유어스 레더 라운지 스포츠 시트를 적용해 고급스러운 감각을 강조했다. 또한 여행 시 트렁크에 벤치처럼 걸터앉을 수 있는 탈착식 피크닉 벤치도 함께 제공해 특유의 로드 트립 감성을 극대화했다.
	이와 함께 전면 충돌 경고 기능, 보행자 경고 및 차선 이탈 경고 기능을 포함한 드라이빙 어시스턴트와 자동 조향 기능을 포함한 파킹 어시스턴트 등 첨단 운전자 보조 사양을 활용할 수 있어 안락하고 안전한 주행을 지원한다. 이외에도, 파노라마 글라스 루프, 컴포트 액세스, 8.8인치 센터 디스플레이 및 애플 카플레이 등 다양한 편의 사양을 기본 제공한다.
	MINI 컨트리맨 하이랜드 에디션은 쿠퍼 및 쿠퍼 S 모델 각각 단 50대씩 한정 판매되며, 가격은 각각 4950만원, 5730만원이다. (부가세 포함, 개별소비세 5.0% 적용 가격)',
	'테디',
	sysdate,
	'n'
	);

--차량추가
insert into car values(car_seq.nextval,'현대 쏘나타 (DN8)',2346,3590,'현대','Hyundai Sonata (DN8)cover.jpg','Hyundai Sonata (DN8).jpg','7세대로 거듭난 올 뉴 아반떼는 모든 게 바뀌었습니다. 구형의 생명력이 끝나서 밀려 나온 게 아닙니다. 뼈대를 이루는 플랫폼부터 갈아 엎었지요. 신형은 좋은 디자인과 미래적인 장비를 만재해 상품성을 대폭 끌어올렸습니다.
핵심은 차세대 플랫폼입니다. 이로써 무게중심 내리고 하체 세팅을 손봐 운동성을 끌어올렸습니다. 사이즈도 키웠습니다. EF 쏘나타에 버금가는 풍채로써 패밀리카로도 충분합니다. ‘스마트스트림 G1.6’ 엔진은 좋은 효율이 장점입니다. 실제 연비는 웬만한 하이브리드를 웃돌더라고요. 최신 안전장비를 아낌없이 채워 넣은 것도 메리트. 스펙 면에서 깎아 내릴만한 게 없습니다.
약점도 있습니다. 예를 들어 인테리어의 감성품질은 전보다 나빠졌습니다. 헤드라이너나 실내 전반에 쓰인 플라스틱 소재가 구형보다 저렴한 질감입니다. 원가절감의 흔적을 곳곳에서 쉽게 찾을 수 있지요. 승차감도 살짝 아쉽습니다. 경험 상 구형(AD)이 더 부드럽고 쾌적했던 기억입니다.
그래도 신형 아반떼는 분명 추천할 만한 차입니다. 디자인, 운동성, 경제성 면에서 이만큼 합리적인 선택지는 없습니다. 이 정도 패키징 갖춘 차를 이 가격에 살 수 있다는 건 대단한 일이죠. 중고로 살 땐 살짝 비싼 감이 있지만 반대로 말하면 팔 때 제값 받을 수 있는 차라는 얘기가 되기도 합니다. ‘현대차가 제일 잘 만드는 모델이 아반떼’라는 이야기. 터무니 없는 헛소문은 아닌가 봅니다.','중형차',
TO_DATE('2019-03-01', 'YYYY-MM-DD'),'Smartstream G2.0','자동 6단',1999,'전륜','160 / 6,500','맥퍼슨 스트럿 ,멀티 링크',
'20 / 4,800','4개 / 벤틸레이티드 디스크 2개','9','241','n',1860,1445,2840,4900,'Hyundai Sonata (DN8)front.jpg','Hyundai Sonata (DN8)side.jpg');

insert into car values(car_seq.nextval,'현대 LF 쏘나타',2255,2860,'현대','현대 LF 쏘나타cover.jpg','Hyundai Sonata (DN8).jpg','‘중형차’를 사려는 마음으로 접근하면 일부분에서 아쉬움이 느껴져요. SM6의 고급감도 없고 말리부의 디자인 내지 파워트레인적 혁신도 없으니까요. 실내는 온통 플라스틱 일색이고 2.0L의 자연흡기 엔진은 성능이나 연비 면에서 장점이 없습니다.
하지만 이게 쏘나타의 매력 아닌 매력입니다. 짐짓 보수적인 스타일과 광활한 실내 공간, 너무나 편한 정비성, 무난한 운동성까지 모난 데 없어 이동수단으로서 쓰기 좋거든요. 미국 소비자들이 토요타 캠리에 느낄 수 있는 매력을, 그야말로 "무색 무취 무미"와 같은 자동차로서의 감각을 한국 소비자들은 현대 쏘나타를 통해 만나볼 수 있다는 겁니다. 가족용 자동차 또는 편한 출퇴근용 자동차로 추천합니다.','중형차',
TO_DATE('2014-03-01', 'YYYY-MM-DD'),'Smartstream G2.0','자동 6단',1999,'전륜','168 / 6,500','맥퍼슨 스트럿 ,멀티 링크',
'20.5 / 4,800','4개 / 벤틸레이티드 디스크 2개','11.6','190','n',1865,1475,2805,4855,'현대 LF 쏘나타front.jpg','현대 LF 쏘나타side.jpg');

insert into car values(car_seq.nextval,'현대 더 뉴 싼타페',3414,4128,'현대','현대 더 뉴 싼타페cover.jpg','현대 더 뉴 싼타페.jpg','4세대 부분변경을 거친 더 뉴 싼타페의 하이브리드 버전입니다. 파워트레인은 투싼, 쏘렌토, 스포티지 하이브리드 모델과 동일하며, 시스템 합산 최고 출력 230마력, 최대 토크 35.7kgf.m의 성능을 발휘합니다.
대표적인 국산 중형 패밀리 SUV답게 넓은 실내 공간뿐만 아니라 누구나 쉽게 다룰 수 있을 만큼 편안한 주행 감각이 돋보입니다. 더욱이 하이브리드 시스템이 더해지면서 연비 또한 향상되었습니다. 친환경차 세제혜택과 취득세 감면도 받을 수 있습니다. 1600cc로 낮아진 배기량으로 자동차세까지 저렴해졌습니다.
무엇보다 쏘렌토의 활약덕분인지 하이브리드 모델의 상품 구성은 훌륭한 편입니다. 하이브리드의 낮은 등급인 익스클루시브부터 듀얼 풀 오토 에어컨, 하이패스 시스템, 운전자 인식형 스마트 주행모드, 10.25인치 내비게이션이 모두 기본 적용입니다. 가솔린과 디젤 모델에서는 130만 원의 멀티미디어 내비 플러스 선택 품목을 추가해야 누릴 수 있는 옵션들이죠. 스마트 파워 테일 게이트와 운전석 자동 쾌적 제어도 하이브리드 익스클루시브에 기본으로 적용됩니다. 원하면 사륜구동 시스템까지 추가할 수 있습니다.
이러한 장점에도 불구하고 디자인에 대한 호불호는 아직까지 명확하게 나뉩니다. 다소 심심하지만 잘 정돈된 실내 디자인과 달리 외관은 쏘렌토에 비해 혹평이 많습니다. 마치 마스크를 착용한 듯한 전면 디자인은 더 뉴 싼타페의 가장 큰 약점으로 꼽히기도 합니다. 위로는 팰리세이드, 아래로는 투싼 사이에서 조금은 애매해진 싼타페의 가치는 여전할까요?','중형차',
TO_DATE('2023-08-16', 'YYYY-MM-DD'),'Smartstream G2.0','자동 8단',2497,'전륜','281 / 5800','맥퍼슨 스트럿 ,멀티 링크',
'42.9 / 1700','4개 / 벤틸레이티드 디스크 2개','9','241','n',1910,1710,2765,4800,'현대 더 뉴 싼타페front.jpg','현대 더 뉴 싼타페side.jpg');

insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design1.jpg',1);

insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design2.jpg',1);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design3.jpg',1);

-- 커뮤니티 추가
insert into board values(board_seq.nextval,1,'볼보차',1,'현대,기아 한국 자동차만 시승하다가 이제 슬슬 질리는데 혹시 외제차 볼보나 bmw는 시승못하는 건가요?',
sysdate,100,'n');

insert into board values(board_seq.nextval,2,'와 이건 개쩐다',2,'여러분들 현대 EV9 너무 좋네요 저희가 5인가족인데 자리도 넓고 차가 안정감이 뛰어난 것 같아요 혹시 
구매 고민중이시면 꼭 시승 해보세요',sysdate,99,'n');

insert into board values(board_seq.nextval,3,'너무 이뻐요',3,'Ray EV 구매 고민중에 이번에 시승해 봤는데 역시 사야겠어요 차도 이쁘고 무엇보다 한번 충전으로 
엄청 오래 달려서 너무 좋은것 같아요 바로 구매하러 달려갑니다.',sysdate,98,'n');

insert into board values(board_seq.nextval,4,'시승 잘했네요',4,'이번에 애가 생기면서 무슨 차를 사야하나 고민중이였는데 테디는 여러차를 시승할수 있다고 들어서 시승예약하고 여러개 시승해봤어요
역시 시승하길 잘했다고 생각이들고 시승 도와 주시는 분도 친절하셔서 기분좋게 시승하고 왔어요',sysdate,97,'n');

insert into board values(board_seq.nextval,5,'추천해요',5,'시승예약부터 시승까지 직원 분들이 꼼꼼하게 신경 써 주시고 편안하고 친절하게 대해 주셔서 주변 분들에 시승 할 생각있으신 분 있으면 무저건 추천 할려고요 ',sysdate,96,'n');

insert into board values(board_seq.nextval,6,'회사차구매',6,'회사 전용 차가 필요해서 알아보다가 시승 서비스를 제공하는 테디를 알게되었네요 덕분에 시승하고 맘에 드는 차로 구매완료!!!!',sysdate,95,'n');

select notice_seq.nextval from dual;
desc notice;

select * from car;

