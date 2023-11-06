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

drop sequence car_seq;


DROP TABLE car CASCADE CONSTRAINTS;
drop sequence car_seq;


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
drop sequence design_img_seq;


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

    b_content varchar2(2000),       -- 게시글 내용

    b_date date,                    -- 게시글 작성 날짜
    b_cnt number,                   -- 게시글 조회수
    b_del char(1),                   -- 게시글 삭제여부
    foreign key(id) references member(id)
);
create sequence board_seq start with 1 increment by 1 maxvalue 999999;
select * from board;
drop table board;


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
이러한 장점에도 불구하고 디자인에 대한 호불호는 아직까지 명확하게 나뉩니다. 다소 심심하지만 잘 정돈된 실내 디자인과 달리 외관은 쏘렌토에 비해 혹평이 많습니다. 마치 마스크를 착용한 듯한 전면 디자인은 더 뉴 싼타페의 가장 큰 약점으로 꼽히기도 합니다. 위로는 팰리세이드, 아래로는 투싼 사이에서 조금은 애매해진 싼타페의 가치는 여전할까요?','SUV',
TO_DATE('2023-08-16', 'YYYY-MM-DD'),'Smartstream G2.0','자동 8단',2497,'전륜','281 / 5800','맥퍼슨 스트럿 ,멀티 링크',
'42.9 / 1700','4개 / 벤틸레이티드 디스크 2개','9','241','n',1910,1710,2765,4800,'현대 더 뉴 싼타페front.jpg','현대 더 뉴 싼타페side.jpg');

insert into car values(car_seq.nextval,'현대 그랜저 IG',1411,2568,'현대','현대 그랜저 IGcover.jpg','현대 그랜저 IG.jpg','대한민국 중산층의 상징처럼 여겨지는 모델입니다. 한마디로 ‘고급형 쏘나타’랄까. 준수한 외모와 정비 용이성, 저렴한 자동차 보험료, 광활한 실내까지 한국인이 차 고를 때 중점 두는 가치들을 잘 충족시켜줍니다. 마치 84㎡짜리 아파트 같아요. 세금 혜택도 적당히 볼 수 있고, 좁다는 소리도 안 듣고, 팔 때도 회전율 높은 그런 집. 특출하게 고급스럽다거나 화려하지 않지만 그렇다고 어디 가서 무시 당할 일도 없지요. 이게 요즘 그랜저의 가치 아닐까요.
신형은 HG보다 젊고 작아 보여 더 이상 고급차로 일컫기 어려운 느낌입니다. 그렇지만 개선된 섀시와 쾌적한 실내, 좋은 장비들 때문에 상품성은 역대 최고 수준을 달립니다. 이 값에 이만한 차는 정말 흔치 않죠. 그랜저 사실 때 대개 2.4와 3.0 중 고민할 텐데 필자는 후자를 추천하는 바입니다. 엔진 스크래치 이슈로부터 좀 더 자유롭고 무엇보다 주행성 면에서 급 차이가 확연하기 때문이죠. 그 내용을 확인하려면 ‘성능’ 탭을 꼼꼼히 살펴보시기 바랍니다.','대형차',
TO_DATE('2016-01-05', 'YYYY-MM-DD'),'Smartstream G2.0','자동 6단',2359,'전륜','190 / 6000','맥퍼슨 스트럿 ,멀티 링크',
'24.6 / 4000','4개 / 벤틸레이티드 디스크 2개','9','241','n',1865,1470,2845,4930,'현대 그랜저 IGfront.jpg','현대 그랜저 IGside.jpg');

insert into car values(car_seq.nextval,'현대 더 뉴 아반떼 AD',3055,3870,'현대','현대 더 뉴 아반떼 ADcover.jpg','현대 더 뉴 아반떼 AD.jpg','현대자동차의 신차 출시 주기는 보통 5~6년입니다. 그래서 신차가 나온 후 제품수명주기의 중간인 3년쯤 되는 시점에 부분 변경 모델을 내놓죠. 이를 두고 페이스리프트 모델이라고도 합니다. 내외관을 손봐 상품성을 끌어올리는 겁니다. 기업 입장으로서는 매력적인 조건입니다. 개발비 적게 들이면서도 신차 효과를 누릴 수 있으니까요.
이번에 <모카>에서 다룰 차는 더 뉴 아반떼(AD)입니다. 페이스리프트 모델로서는 드물게 안팎을 파격적으로 바꿨습니다. 예를 들어 얼굴뿐만 아니라 엔진과 변속기도 바꿨습니다. 핵심은 파워트레인입니다. 올 뉴 K3에 먼저 선보였던 신형 엔진(스마트스트림)과 무단변속기(IVT)를 얹었습니다. 연비 중시한 엔진 덕에 공인 연비는 15.2km/L까지 좋아졌죠. 실제로도 연비 잘 나옵니다. 웬만한 시내 구간에서도 두 자릿수 아래로 떨어지지 않고 고속도로 항속 주행하면 L당 20km쯤은 가뿐히 달립니다. 상품성 또한 역대 아반떼 중 으뜸으로 꼽을 만합니다. 깡통 등급 살지라도 첨단 안전 장비를 넣을 수 있고 앞좌석은 물론 뒷좌석 편의장비도 만재할 수 있지요. 패밀리카로도 좋은 선택지입니다.
신형 아반떼는 출시 전부터 ‘삼각반떼’ 등 여러 별명을 만들어냈습니다. 바뀐 외관에 대한 불만을 표출한 거죠. 출시 두 달차에 접어든 현재(2018년 11월), 디자인에 대한 논란은 살짝 수그러든 듯 합니다. 판매량이 이를 증명합니다. 여전히 우리나라에서 가장 많이 팔리는 준중형 세단이기 때문입니다. 디자인도 점차 익숙해질 겁니다. 길에서 가장 쉽게 마주칠 수 있는 자동차가 될 테니까요.','준중형차',
TO_DATE('2018-09-06', 'YYYY-MM-DD'),'Smartstream G2.0','CVT',1598,'전륜','123 / 6300','맥퍼슨 스트럿 ,토션 빔',
'15.7 / 4500','4개 / 벤틸레이티드 디스크 2개','9','241','n',1800,1440,2700,4620,'현대 더 뉴 아반떼 ADfront.jpg','현대 더 뉴 아반떼 ADside.jpg');

insert into car values(car_seq.nextval,'현대 엑센트(신형)',1348,1700,'현대','현대 엑센트(신형)cover.jpg','현대 엑센트(신형).jpg','무난한 디자인과 좋은 장비를 담은 현대의 간판 소형차입니다. 형제차인 프라이드가 유럽 감각이라면 엑센트는 미국 소비자 취향을 고려한 쪽이지요. 소형차치고는 제법 부드러운 승차감과 꾸준히 미는 성향의 가속력도 이를 방증합니다. 그래서 이 차는 ‘스포츠’보다 ‘콤포트’ 성향을 선호하는 이에게 어울리지요. 그 반대라면 기아 프라이드가 낫고요.
콤팩트한 차체로 주차나 좁은 길 주파가 편해 초보 운전자에게 추천할 만하고 그럼에도 실내 공간과 짐 공간이 넉넉해 매력이 높습니다. 연비가 좋고 수리비나 정비비가 저렴하다는 것도 장점이죠. 신차가는 아반떼와 큰 차이가 없었지만 아반떼보다 감가율이 높아 중고차로 구매할 때는 한결 저렴하다는 것도 중요한 포인트입니다.','경차/소형차',
TO_DATE('2022-09-06', 'YYYY-MM-DD'),'1.6 GDi','자동 6단',1591,'전륜','140 / 6300','맥퍼슨 스트럿 ,토션 빔',
'16.9 / 4850','4개 / 벤틸레이티드 디스크 2개','9','160','n',1705,1455,2570,4370,'현대 엑센트(신형)front.jpg','현대 엑센트(신형)side.jpg');

insert into car values(car_seq.nextval,'현대 올 뉴 투싼',2351,3161,'현대','현대 올 뉴 투싼cover.jpg','현대 올 뉴 투싼.jpg','3세대 투싼의 후기형입니다. 2018년 8월, 페이스리프트를 통해 디자인과 파워트레인(1.7D→1.6D)을 다듬었습니다. 신형 투싼 볼 때에는 부분 변경 거치며 달라진 포인트들을 짚어보세요. 특히 인테리어가 제법 바뀌었습니다. 안전장비나 편의장비 선택지도 늘어났죠. 보태어 엔진과 변속기를 손봐 경제성을 끌어올린 게 핵심입니다.
패밀리카로 투싼을 고려하는 분들은 흔히 싼타페도 함께 봅니다. 조금 돈 보태면 비슷한 값인데도 여유로운 공간을 누릴 수 있기 때문. 실제 2.0L 디젤을 기준으로 편의장비를 비슷하게 맞춘다면 서로 간의 값 차이는 200만 원에 불과합니다. 신형 플랫폼을 쓴 점이나 새로운 디자인 큐를 받아들인 것도 싼타페의 장점입니다. 결국 값 대비 가치를 따지면 오히려 싼타페가 나을 수 있다는 이야기죠. 따라서 가족용차로 투싼을 살 때에는 싼타페와 값 차이 적은 2.0보다 차라리 1.6 디젤을 보는 게 합리적이라는 생각입니다. 대신 혼자 탈 용도로 여유로운 출력을 누리고자 한다면 2.0 디젤을 사되 등급 내지 편의장비에서 타협하는 걸 권합니다.','SUV',
TO_DATE('2015-03-17', 'YYYY-MM-DD'),'Smartstream G2.0','자동 7단',1598,'전륜','136 / 4000','맥퍼슨 스트럿 ,멀티 링크',
'32.6 / 2000','4개 / 벤틸레이티드 디스크 2개','9','160','n',1850,1650,2670,4480,'현대 올 뉴 투싼front.jpg','현대 올 뉴 투싼side.jpg');

insert into car values(car_seq.nextval,'현대 아반떼 (CN7)',1531,2467,'현대','현대 아반떼 (CN7)cover.jpg','현대 아반떼 (CN7).jpg','7세대로 거듭난 올 뉴 아반떼는 모든 게 바뀌었습니다. 구형의 생명력이 끝나서 밀려 나온 게 아닙니다. 뼈대를 이루는 플랫폼부터 갈아 엎었지요. 신형은 좋은 디자인과 미래적인 장비를 만재해 상품성을 대폭 끌어올렸습니다.
핵심은 차세대 플랫폼입니다. 이로써 무게중심 내리고 하체 세팅을 손봐 운동성을 끌어올렸습니다. 사이즈도 키웠습니다. EF 쏘나타에 버금가는 풍채로써 패밀리카로도 충분합니다. ‘스마트스트림 G1.6’ 엔진은 좋은 효율이 장점입니다. 실제 연비는 웬만한 하이브리드를 웃돌더라고요. 최신 안전장비를 아낌없이 채워 넣은 것도 메리트. 스펙 면에서 깎아 내릴만한 게 없습니다.
약점도 있습니다. 예를 들어 인테리어의 감성품질은 전보다 나빠졌습니다. 헤드라이너나 실내 전반에 쓰인 플라스틱 소재가 구형보다 저렴한 질감입니다. 원가절감의 흔적을 곳곳에서 쉽게 찾을 수 있지요. 승차감도 살짝 아쉽습니다. 경험 상 구형(AD)이 더 부드럽고 쾌적했던 기억입니다.
그래도 신형 아반떼는 분명 추천할 만한 차입니다. 디자인, 운동성, 경제성 면에서 이만큼 합리적인 선택지는 없습니다. 이 정도 패키징 갖춘 차를 이 가격에 살 수 있다는 건 대단한 일이죠. 중고로 살 땐 살짝 비싼 감이 있지만 반대로 말하면 팔 때 제값 받을 수 있는 차라는 얘기가 되기도 합니다. ‘현대차가 제일 잘 만드는 모델이 아반떼’라는 이야기. 터무니 없는 헛소문은 아닌가 봅니다.','준중형차',
TO_DATE('2023-04-07', 'YYYY-MM-DD'),'G4FM','CVT',1598,'전륜','123 / 6300','맥퍼슨 스트럿 ,토션 빈',
'15.7 / 4500','4개 / 벤틸레이티드 디스크 2개','10','160','n',1825,1420,2720,4650,'현대 아반떼 (CN7)front.jpg','현대 아반떼 (CN7)side.jpg');

insert into car values(car_seq.nextval,'현대 아이오닉 하이브리드',2438,2898,'현대','현대 아이오닉 하이브리드cover.jpg','현대 아이오닉 하이브리드.jpg','토요타 프리우스 겨냥해 만들어진 모델. 하이브리드, 플러그인 하이브리드, 전기차 버전으로만 나오는 본격적인 친환경차예요. 이번에 다룰 버전은 가장 많이 팔리는 아이오닉 하이브리드. 1.6L 직분사 가솔린 엔진에 43마력 정도를 내는 전기 모터를 더하고, 여기에 6단 듀얼 클러치 변속기 물린 ‘변태 조합’을 품고 있습니다. 
하체도 제법 스포티하게 짜여 있고, 버추얼 클러스터로 일컬어지는 LCD 계기판이나 푸른 장식 등 젊은 층이 좋아할 만 한 점이 많아요. 그렇지만 초기 결함과 하이브리드카에 대한 생경함으로 인해 잘 팔리지는 않습니다. 결국 그 가치에 비해 저평가되어 있다는 생각이죠. 역설하자면 이런 겁니다. 차 자체의 상품성이 훌륭하고 무엇보다 연비가 좋으므로 준중형차 고르는 분들은 꼭 한 번 고려해 보라는 것. 특히 주행거리 많아 기름값 부담되지만 딸딸거리는 디젤이 싫다면 ‘강추’할 만합니다.','준중형차',
TO_DATE('2017-02-17', 'YYYY-MM-DD'),'G4FM','수동6단',1580,'전륜','141 / 5700','맥퍼슨 스트럿 ,멀티 링크',
'15.7 / 4500','4개 / 벤틸레이티드 디스크 2개','9.5','170','n',1820,1450,2700,4470,'현대 아이오닉 하이브리드front.jpg','현대 아이오닉 하이브리드side.jpg');

insert into car values(car_seq.nextval,'현대 쏘나타 뉴 라이즈',2255,2933,'현대','현대 쏘나타 뉴 라이즈cover.jpg','현대 쏘나타 뉴 라이즈.jpg','LF 쏘나타의 부분 변경 모델. 조금 비꼬아 말하면 그저 기존 쏘나타의 껍질만 바꾼 격입니다. 엔진이나 섀시 등의 나머지 것들은 그대로라는 뜻이지요. 이런 걸 보통 "페이스리프트"로 일컫는데요. 이런 소소한 변화를 주었음에도 "뉴 라이즈"라는 수식어로써 더욱 새로운 모델처럼 다가옵니다.
실제로도 바깥쪽은 적잖이 변했습니다. 그래서 잘 모르는 사람들은 완전한 신형(풀 모델 체인지)으로 보기도 합니다. 문제는 변하긴 변했는데 못생기게 변했다는 겁니다. 딱 봐도 구리지 않나요? 이를 두고 사람들은 ‘쏘나타 역사 상 가장 못난 디자인’이라든가 ‘그랜저를 팔기 위한 현대의 계산’이라고 말하더군요. 개인적으로는 그런 해석조차 아깝습니다. 이걸 디자인이라고.
얼굴을 빻았지만 다행스럽게도 나머지 부분은 장점들로 들어찼습니다. 2,000만원 대 예산 들고 가족이 함께 탈 만한 차를 추천해야 한다? 그렇다면 주저 없이 1순위에 올릴 수 있는 모델이에요. 말도 안 되게 널찍한 실내와 편한 관리, 적은 잔고장, 무난한 성능 등 좋은 점이 가득합니다. 더불어 뉴 라이즈로 넘어오며 지나칠 만큼 따분했던 실내가 제법 고급스러워진 것도 반갑습니다. 차에 크게 신경 기울이지 않고 편하게 탈 만한 녀석이 필요하신가요? 그럴 땐 역시 쏘나타가 "진리"입니다.','중형차',
TO_DATE('2017-05-18', 'YYYY-MM-DD'),'G4FM','수동6단',1999,'전륜','163 / 6500','맥퍼슨 스트럿 ,멀티 링크',
'20 / 4800','4개 / 벤틸레이티드 디스크 2개','10','185','n',1865,1475,2805,4855,'현대 쏘나타 뉴 라이즈front.jpg','현대 쏘나타 뉴 라이즈side.jpg');

insert into car values(car_seq.nextval,'현대 LF 쏘나타 하이브리드',2786,3230,'현대','현대 LF 쏘나타 하이브리드cover.jpg','현대 LF 쏘나타 하이브리드.jpg','카 마니아가 아닌 일반인의 기준으로서 ‘좋은 자동차’를 따진다면, 이 차는 으뜸이 될 만한 자질로 꽉 찼습니다. 하이브리드카로서 이례적인 스포티 스타일, 풀 사이즈 세단 수준의 실내 공간,
 좋은 성능과 연비까지 장점으로 가득하지요. 값 대비 가치까지 따지면 정말이지 우주 최강입니다. 하이브리드 자동차에 주어지는 취득세와 소비세 면제 혜택, 보조금을 받는다면 가솔린 모델 살 예산으로도 접근할 수 있죠. 이런 연유로써 LF 쏘나타 하이브리드는 모카가 ‘강추’하는 모델입니다.','중형차',
TO_DATE('2017-05-18', 'YYYY-MM-DD'),'ν 2.0 GDi','수동6단',1999,'전륜','191 / 5500','맥퍼슨 스트럿 ,멀티 링크',
'27 / 5000','4개 / 벤틸레이티드 디스크 2개','10','185','n',1865,1475,2805,4855,'현대 LF 쏘나타 하이브리드front.jpg','현대 LF 쏘나타 하이브리드side.jpg');


insert into car values(car_seq.nextval,'기아 올 뉴 K3',1590,2585,'기아','기아 올 뉴 K3cover.jpg','기아 올 뉴 K3.jpg','현대 아반떼와 더불어 국산 준중형차를 대표하는 모델. 하지만 아반떼의 그늘에 가려 늘 2인자로 살았던 차입니다. 그런데 이번에는 기아가 작정하고 만들었나 봅니다. 일단 디자인부터 확 좋아졌습니다. 앞뒤 모습이 잘 생겨졌고 보디 길이도 아반떼보다 70mm 키웠습니다. 실내도 최신 트렌드를 따라 플로팅 타입 모니터를 얹었습니다. 감성품질과 디자인, 사용성과 실용성 모두 아반떼를 앞지르는 듯합니다.
결정적으로 새 엔진과 변속기가 K3의 무기입니다. 사실 수치(123마력)와 스펙(CVT) 때문에 불신이 있었을 텐데요. 막상 타보니 가속이 훌륭하고 실내도 조용했습니다. 연비는 뭐, 웬만한 하이브리드를 웃돌더라고요. 이 수준이면 아반떼 AD를 누를 수 있겠다 싶었습니다. 실제로 2018년 4월 판매량에서 아반떼를 이겼다지요.','준중형차',
TO_DATE('2018-02-27', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','CVT',1598,'전륜','123 / 6300','맥퍼슨 스트럿 ,토션 빈',
'15.7 / 4500','4개 / 벤틸레이티드 디스크 2개','10','185','n',1800,1440,2700,4640,'기아 올 뉴 K3front.jpg','기아 올 뉴 K3side.jpg');

insert into car values(car_seq.nextval,'기아 스팅어',4460,4880,'기아','기아 스팅어cover.jpg','기아 스팅어.jpg','BMW 4시리즈 그란 쿠페를 겨냥한 기아의 스포츠 모델입니다. 한데 덩치로 보나 출력으로 보나 4시리즈보다는 
‘가난한 자의 파나메라’에 가까운 것 같아요. 즐거운 코너링을 네 명 타고 즐길 수 있다는 점에서 교집합이 있죠. 일단 문짝이 네 개인 데다 네 명이 탈 수 있으니 부인이나 부모님께 허락 맡기도 수월할 겁니다. 예전에 제네시스 쿠페 사면 개념 없다는 소리 듣기 딱 좋았는데 스팅어는 그런 시선으로부터 한결 자유로운 게 장점입니다.
가솔린 2.0 터보 버전은 ‘스포츠’라는 키워드에 비해 파워가 좀 약합니다. 2.2 디젤은 달리기보다 효율에 초점 맞춘 모델. 대신 가솔린 3.3 터보는 0→100km/h 가속을 4.9초에 끊고 최고시속 270km를 자랑하는 준족입니다. 평소에 몰 때는 운전재미나 감성 면에서 실망스러워도 트랙에서는 뒤쪽이 예쁘게 미끄러져 재미 좋습니다.
 순정 상태에서 브레이크 패드와 타이어 정도만 보강하면 아주 좋은 랩타임을 낼 수 있는 차. 다만 일상에서의 운전이라면 ‘그냥 평범한 국산차 같다’는 생각이 들 수도 있습니다. 퓨어 스포츠 모델 찾을 경우 비추, 쾌적하고 절대 속도가 빠른 투어러를 원한다면 추천합니다.','중형차',
TO_DATE('2017-05-23', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동8단',3342,'후륜','370 / 6000','맥퍼슨 스트럿 ,멀티 링크',
'52 / 1300','4개 / 벤틸레이티드 디스크 4개','4.9','200','n',1870,1400,2905,4830,'기아 스팅어front.jpg','기아 스팅어side.jpg');

insert into car values(car_seq.nextval,'기아 더 K9',5580,9159,'기아','기아 더 K9cover.jpg','기아 더 K9.jpg','기아자동차 최상위 모델입니다. 제네시스 G90보다 훨씬 저렴한 값에 G90에 준하는 편의장비를 누릴 수 있다는 게 더 K9의 장점입니다. 결국 값 대비 가치가 좋다는 뜻이죠. 이 때문에 G90의 대체재는 물론이고 G80의 대체재로도 주목 받습니다. G80과 거의 비슷한 값으로 살 수 있거든요. 중고차로 사면 더욱 매력적이고요.
더 K9은 직접 운전할 만한 대형 세단을 찾는 분, 경제적이면서도 이따금 뒷자리에 사람 태울 용도로 쓸만한 모델을 찾는 이에게 추천합니다. 고속도로 주행 보조가 전 사양 기본이니 장거리 주행 잦은 이에게도 적합할 겁니다. 중고 시세가 조금 더 내려간다면 더 뉴 그랜저 신차 살 예산으로도 노려볼 만합니다. 그렇게 된다면 고급스러운 패밀리카로도 쓰임새가 좋겠지요.','대형차',
TO_DATE('2021-06-15', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동8단',3778,'후륜','315 / 6000','맥퍼슨 스트럿 ,멀티 링크',
'40.5 / 5000','4개 / 벤틸레이티드 디스크 4개','5','180','n',1915,1490,3105,5120,'기아 더 K9front.jpg','기아 더 K9side.jpg');

insert into car values(car_seq.nextval,'기아 쏘렌토 4세대',3002,4708,'기아','기아 쏘렌토 4세대cover.jpg','기아 쏘렌토 4세대.jpg','2020년 3월 출시한 4세대 쏘렌토의 코드명은 MQ4입니다. 2014년 등장해 6년간 판매한 3세대 쏘렌토의 뒤를 잇는 기아 SUV 대표 모델입니다. 가장 큰 경쟁 상대는 집안 식구인 현대자동차 싼타페입니다. 4세대 쏘렌토가 등장하기 전까지 국내 중형 SUV 시장은 싼타페가 꽉 잡고 있었지만, 4세대 쏘렌도 등장 이후 상황은 급변했습니다.
4세대 쏘렌토는 같은 시기 판매한 4세대 싼타페보다 판매량이 앞섭니다. SUV 특유의 강인함을 살린 매력적인 디자인, 싼타페보다 한 발 앞서 채택한 현대차그룹의 3세대 플랫폼의 무난한 주행 질감. 패밀리카로 손색없는 넉넉한 실내 공간, 풍부한 편의장비와 같은 매력을 무기로 시장에서 큰 인기를 얻고 있습니다.','SUV',
TO_DATE('2020-03-11', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동6단',1598,'전륜','230 / 6000','맥퍼슨 스트럿 ,멀티 링크',
'35.7 / 5000','4개 / 벤틸레이티드 디스크 4개','8','180','n',1900,1700,2815,4810,'기아 쏘렌토 4세대front.jpg','기아 쏘렌토 4세대side.jpg');

insert into car values(car_seq.nextval,'기아 더 뉴 레이',3002,4708,'기아','기아 더 뉴 레이cover.jpg','기아 더 뉴 레이.jpg','더 뉴 레이는 기존 레이의 페이스리프트 모델입니다. 큰 틀은 그대로 두되 앞뒤 램프를 비롯한 소소한 디테일들 변경한 것. 이 때문에 웬만한 사람들은 “구형과 다른 게 뭐냐”며 낮잡아 볼 텐데요. 뭐 일부는 맞는 말입니다. 껍질은 거의 그대로니까요. 대신 성능이 좋아졌습니다. 가령 구형 레이는 가속이 너무 느려 ‘비추’하고 싶은 차였습니다만 신형은 한결 낫습니다. 좀 탈 만해졌어요.
일단 멍청하던 변속기가 제 역할을 하기 시작했습니다. 예전에는 가속 페달 꾹꾹 밟아도 안 나갔었지만 신형은 제법 속도 올릴 줄 알죠. 하체 개선은 더욱 긍정적입니다. 구형은 이따금 댐퍼가 터진 차처럼 굴었습니다. 반면 더 뉴 레이는 웬만한 준중형차 수준의 쾌적성을 보장합니다. 누구라도 구형과 비교해 타 보면 “승차감이 너무 좋아졌다”고 말하게 될 정도. 아울러 노면 소음이 줄어든 것도 반가운 부분입니다.','경차/소형차',
TO_DATE('2017-12-13', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동4단',998,'전륜','78 / 6400','맥퍼슨 스트럿 ,토션 빔',
'9.6 / 3500','4개 / 벤틸레이티드 디스크 2개','9','170','n',1595,1700,2520,3595,'기아 더 뉴 레이front.jpg','기아 더 뉴 레이side.jpg');

insert into car values(car_seq.nextval,'기아 모하비 더 마스터',3002,4708,'기아','기아 모하비 더 마스터cover.jpg','기아 모하비 더 마스터.jpg','2019년 9월에 나온 모하비 더 마스터입니다. 모하비는 올해(2020년)로 출시 13년차를 맞이한 장수 모델입니다. 사실 ‘사골’로 보는 이도 많습니다. 풀 체인지 없이 부분 변경만 두 번 했으니 달갑게 느껴지지 않을 테지요.
그래도 페이스리프트치고는 꽤 많은 것들이 달라졌습니다. 디자인을 갈아 엎어 신선한 느낌을 냅니다. 상품성도 돋보입니다. 모니터를 비롯한 각종 전자 장비들이 현대화 됐고 능동형 안전 장비와 자율 주행 시스템 같은 최신 장비들을 만재했습니다. 260마력짜리 V6 3.0L 디젤 엔진은 여전히 매력적입니다. 오랜 기간 쓰인 만큼 파워트레인의 믿음직스럽고요. 아울러 프레임 보디로써 거친 도로 주파하기에 좋습니다. 완성도 면에서도 괜찮은 평가를 받고 있습니다.','SUV',
TO_DATE('2019-09-07', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동8단',2959,'사륜','260 / 3800','위시본 ,멀티 링크',
'56.1 / 1500','4개 / 벤틸레이티드 디스크 2개','9.6','190','n',1920,1790,2895,4930,'기아 모하비 더 마스터front.jpg','기아 모하비 더 마스터side.jpg');

insert into car values(car_seq.nextval,'기아 K5 2세대',2265,2905,'기아','기아 K5 2세대cover.jpg','기아 K5 2세대.jpg','한때 잠시나마 중형차 시장의 ‘1인자’였다가 지금은 4위로 밀려난 비운의 모델입니다. 1세대의 성공을 계승하고자 디자인을 답습해 2세대를 만들었더니 소비자들이 “신차 같지 않다”며 외면한 까닭이죠. 사실 상품성 자체는 1세대와 비교 불가할 만큼 좋아졌습니다. 안전성이 으뜸의 경지에 올라 왔고 깡통 같던 주행성도 한층 진지해졌죠. 장비 수준은 여전히 우수, 실내 공간도 쏘나타 버금갈 만큼 널찍해 여럿이 타기 충분합니다.
이 차의 가장 큰 적은 ‘이미지’입니다. ‘양카’ 같다든가 택시나 렌터카가 너무 많다는 건 일반인 입장에서 선택을 주저하게 만들지요. 결정적으로 더 완성도 높은 형제차인 LF 쏘나타를 두고 K5를 고를 만한 동기를 갖기 어렵습니다. 예전처럼 스타일 때문에 선택하기에는 르노삼성의 SM6가 버티고 있어 갈 길 잃은 셈입니다. 결국 이 차는 쏘나타보다 저렴한 값으로서 ‘값 대비 가치’를 중시하는 이들에게 어울린다는 평가입니다.','중형차',
TO_DATE('2015-12-03', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동6단',1999,'전륜','168 / 6500','맥퍼슨 스트럿 ,멀티 링크',
'20.5 / 4800','4개 / 벤틸레이티드 디스크 2개','9.6','190','n',1860,1465,2805,4855,'기아 K5 2세대front.jpg','기아 K5 2세대side.jpg');

insert into car values(car_seq.nextval,'기아 올 뉴 K7',3053,3657,'기아','기아 올 뉴 K7cover.jpg','기아 올 뉴 K7.jpg','현대 그랜저와 더불어 대한민국 대표 준대형 세단입니다. 쏘나타와 K5가 보편적이고 검소한 이미지의 가족용 차를 지향한다면 올 뉴 K7은 성공한 직장인 내지 30대 중반 이상의 소비자를 겨냥하지요. 포지셔닝에 맞게 보수적인 외장과 멋 부린 인테리어를 품었습니다. 나름대로 고급스런 분위기를 낼 줄 알죠. 특히 화려한 익스테리어는 그랜저보다 비싼 차처럼 보이기 충분합니다. 여기에 세단 모델 중 가장 널찍한 실내 품어 여러 명이 타는 용도로 쓰기에도 좋습니다.
실 구매가가 ‘가성비’ 좋다는 그랜저(IG)보다 150만원 쯤 저렴한 것도 장점입니다. K7 특유의 재고차 할인이나 각종 프로모션까지 입히면 값 차이가 더욱 벌어져 우주 최강의 수준에 오르지요. 섀시가 그랜저 대비 살짝 덜 조율된 듯하지만 가격을 생각하면 문제 삼을 수 없습니다. 나름의 경제적인 여유를 갖고 4명이 넉넉하게 탈 차 고르는 상황인 분께 강력 추천합니다.','대형차',
TO_DATE('2016-01-26', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','자동6단',2359,'전륜','190 / 6000','맥퍼슨 스트럿 ,멀티 링크',
'24.6 / 4000','4개 / 벤틸레이티드 디스크 2개','9.6','190','n',1870,1470,2855,4970,'기아 올 뉴 K7front.jpg','기아 올 뉴 K7side.jpg');

insert into car values(car_seq.nextval,'기아 더 뉴 K3',1590,2585,'기아','기아 더 뉴 K3cover.jpg','기아 더 뉴 K3cover.jpg','더 뉴 K3는 기존 K3를 소소하게 바꾼 차입니다. 앞모습 손질과 휠 디자인 변화를 명분으로 ‘더 뉴’ 수식어 붙인 거죠.
 한데 구형 K3와 비교해 바뀐 게 별로 없습니다. 이따금 도로에서 마주치면 어떤 게 그냥 K3이고 어떤 게 더 뉴 K3인지 단번에 알기 힘들 정도. 이 때문에 더 뉴 K3도 구형과 마찬가지로 스타일이 심심합니다. 아마 대부분의 사람들은 쌍용 티볼리보다 성의 없는 디자인이라고 할 거예요. 실내도 구닥다리 감각입니다.
 이제는 한 세대 전으로 느껴지는 디자인 철학이 스몄지요. 멀티미디어 시스템 조작부가 낮게 달려 쓰기 불편하다는 점도 문제입니다. 아울러 대시보드나 문짝에 스민 생선 비늘 무늬는 난해한 디자인 포인트입니다.
이처럼 디자인은 임팩트 약합니다만 가속 능력이 구형보다 한층 빨라진 게 눈에 띕니다. 엔진 실용영역의 힘을 끌어올리고 변속기 로직을 개선한 덕분이지요. 이로써 웬만해서는 도로에서 흐름을 놓치지 않고 잘 달릴 수 있습니다. 비교적 잘 조율된 하체도 울룩불룩한 시내 노면을 잘 소화합니다.
 보태어 소음과 진동을 거르는 능력은 국산 준중형 중 최고 수준. 더 뉴 K3 오너에게 장점을 물으면 제일 먼저 하는 이야기가 “조용하다”는 것이니 알 만합니다. 필자도 공감합니다. 1.6L 가솔린 모델은 소음에 불리한 직분사 엔진(GDI)을 품었는데도 시승 내내 잔잔하게 돌더군요.','준중형차',
TO_DATE('2018-02-27', 'YYYY-MM-DD'),'Gamma 1.6 CVVT','CVT',1598,'전륜','123 / 6300','맥퍼슨 스트럿 ,토션 빈',
'15.7 / 4500','4개 / 벤틸레이티드 디스크 2개','10','185','n',1800,1440,2700,4640,'기아 더 뉴 K3front.jpg','기아 더 뉴 K3side.jpg');

SELECT * FROM CAR;

insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design1.jpg',1);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design2.jpg',1);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design3.jpg',1);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 (DN8)design4.jpg',1);

insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타design1.jpg',2);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타design2.jpg',2);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타design3.jpg',2);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타design4.jpg',2);

insert into design_img values(design_img_seq.nextval,'현대 더 뉴 싼타페design1.jpg',3);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 싼타페design2.jpg',3);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 싼타페design3.jpg',3);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 싼타페design4.jpg',3);

insert into design_img values(design_img_seq.nextval,'현대 그랜저 IGdesign1.jpg',4);
insert into design_img values(design_img_seq.nextval,'현대 그랜저 IGdesign2.jpg',4);
insert into design_img values(design_img_seq.nextval,'현대 그랜저 IGdesign3.jpg',4);
insert into design_img values(design_img_seq.nextval,'현대 그랜저 IGdesign4.jpg',4);

insert into design_img values(design_img_seq.nextval,'현대 더 뉴 아반떼 ADdesign1.jpg',5);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 아반떼 ADdesign2.jpg',5);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 아반떼 ADdesign3.jpg',5);
insert into design_img values(design_img_seq.nextval,'현대 더 뉴 아반떼 ADdesign4.jpg',5);

insert into design_img values(design_img_seq.nextval,'현대 엑센트(신형)design1.jpg',6);
insert into design_img values(design_img_seq.nextval,'현대 엑센트(신형)design2.jpg',6);
insert into design_img values(design_img_seq.nextval,'현대 엑센트(신형)design3.jpg',6);

insert into design_img values(design_img_seq.nextval,'현대 올 뉴 투싼design1.jpg',7);
insert into design_img values(design_img_seq.nextval,'현대 올 뉴 투싼design2.jpg',7);
insert into design_img values(design_img_seq.nextval,'현대 올 뉴 투싼design3.jpg',7);
insert into design_img values(design_img_seq.nextval,'현대 올 뉴 투싼design4.jpg',7);

insert into design_img values(design_img_seq.nextval,'현대 아반떼 (CN7)design1.jpg',8);
insert into design_img values(design_img_seq.nextval,'현대 아반떼 (CN7)design2.jpg',8);
insert into design_img values(design_img_seq.nextval,'현대 아반떼 (CN7)design3.jpg',8);
insert into design_img values(design_img_seq.nextval,'현대 아반떼 (CN7)design4.jpg',8);

insert into design_img values(design_img_seq.nextval,'현대 아이오닉 하이브리드design1.jpg',9);
insert into design_img values(design_img_seq.nextval,'현대 아이오닉 하이브리드design2.jpg',9);
insert into design_img values(design_img_seq.nextval,'현대 아이오닉 하이브리드design3.jpg',9);
insert into design_img values(design_img_seq.nextval,'현대 아이오닉 하이브리드design4.jpg',9);

insert into design_img values(design_img_seq.nextval,'현대 쏘나타 뉴 라이즈design1.jpg',10);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 뉴 라이즈design2.jpg',10);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 뉴 라이즈design3.jpg',10);
insert into design_img values(design_img_seq.nextval,'현대 쏘나타 뉴 라이즈design4.jpg',10);

insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타 하이브리드design1.jpg',11);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타 하이브리드design2.jpg',11);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타 하이브리드design3.jpg',11);
insert into design_img values(design_img_seq.nextval,'현대 LF 쏘나타 하이브리드design4.jpg',11);


insert into design_img values(design_img_seq.nextval,'기아 올 뉴 K3design1.jpg',12);
insert into design_img values(design_img_seq.nextval,'기아 올 뉴 K3design2.jpg',12);
insert into design_img values(design_img_seq.nextval,'기아 올 뉴 K3design3.jpg',12);
insert into design_img values(design_img_seq.nextval,'기아 올 뉴 K3design4.jpg',12);

insert into design_img values(design_img_seq.nextval,'기아 스팅어design1.jpg',13);
insert into design_img values(design_img_seq.nextval,'기아 스팅어design2.jpg',13);
insert into design_img values(design_img_seq.nextval,'기아 스팅어design3.jpg',13);
insert into design_img values(design_img_seq.nextval,'기아 스팅어design4.jpg',13);

insert into design_img values(design_img_seq.nextval,'기아 더 K9design1.jpg',14);
insert into design_img values(design_img_seq.nextval,'기아 더 K9design2.jpg',14);
insert into design_img values(design_img_seq.nextval,'기아 더 K9design3.jpg',14);
insert into design_img values(design_img_seq.nextval,'기아 더 K9design4.jpg',14);

insert into design_img values(design_img_seq.nextval,'기아 쏘렌토 4세대design1.jpg',15);
insert into design_img values(design_img_seq.nextval,'기아 쏘렌토 4세대design2.jpg',15);
insert into design_img values(design_img_seq.nextval,'기아 쏘렌토 4세대design3.jpg',15);
insert into design_img values(design_img_seq.nextval,'기아 쏘렌토 4세대design4.jpg',15);

insert into design_img values(design_img_seq.nextval,'기아 더 뉴 레이design1.jpg',16);
insert into design_img values(design_img_seq.nextval,'기아 더 뉴 레이design2.jpg',16);
insert into design_img values(design_img_seq.nextval,'기아 더 뉴 레이design3.jpg',16);
insert into design_img values(design_img_seq.nextval,'기아 더 뉴 레이design4.jpg',16);

insert into design_img values(design_img_seq.nextval,'기아 모하비 더 마스터design1.jpg',17);
insert into design_img values(design_img_seq.nextval,'기아 모하비 더 마스터design2.jpg',17);
insert into design_img values(design_img_seq.nextval,'기아 모하비 더 마스터design3.jpg',17);
insert into design_img values(design_img_seq.nextval,'기아 모하비 더 마스터design4.jpg',17);

insert into design_img values(design_img_seq.nextval,'기아 K5 2세대design1.jpg',18);
insert into design_img values(design_img_seq.nextval,'기아 K5 2세대design2.jpg',18);
insert into design_img values(design_img_seq.nextval,'기아 K5 2세대design3.jpg',18);
insert into design_img values(design_img_seq.nextval,'기아 K5 2세대design4.jpg',18);


select * from review;
update review set re_del ='n' where re_no = 4;



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



--멤버추가
insert into member values(1,1,'김대은','kde20@naver.com','남자',sysdate,'1.png','n',0);
insert into member values(2,1,'김승현','ksh26@naver.com','여자',sysdate,'2.png','n',0);
insert into member values(3,1,'이영세','lys25@naver.com','남자',sysdate,'3.png','n',0);
insert into member values(4,1,'양형욱','yho29@naver.com','남자',sysdate,'4.png','n',0);
insert into member values(5,1,'강병준','kbj00@naver.com','남자',sysdate,'k8.gif','n',0);
insert into member values(6,1,'그린 컴퓨터','green@naver.com','여자',sysdate,'green.png','n',0);


select notice_seq.nextval from dual;
desc notice;

select * from member;




