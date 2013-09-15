-- 멤버
DROP TABLE IF EXISTS `SPMS_MEMBS` RESTRICT;

-- 멤버사진
DROP TABLE IF EXISTS `SPMS_MEMIMG` RESTRICT;

-- 주소정보
DROP TABLE IF EXISTS `SPMS_ADDR` RESTRICT;

-- 프로젝트
DROP TABLE IF EXISTS `SPMS_PRJS` RESTRICT;

-- 프로젝트멤버
DROP TABLE IF EXISTS `SPMS_PRJMEMB` RESTRICT;

-- 태스크
DROP TABLE IF EXISTS `SPMS_TASKS` RESTRICT;

-- 작업할당
DROP TABLE IF EXISTS `SPMS_MEMBTASK` RESTRICT;

-- 피드
DROP TABLE IF EXISTS `SPMS_FEEDS` RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS `SPMS_FILES` RESTRICT;

-- 피드파일
DROP TABLE IF EXISTS `SPMS_FEEDFILE` RESTRICT;

-- 멤버
CREATE TABLE `SPMS_MEMBS` (
	`EMAIL`       VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	`MNAME`       VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`PWD`         VARCHAR(40)  NOT NULL COMMENT '암호', -- 암호
	`TEL`         VARCHAR(30)  NOT NULL COMMENT '전화번호', -- 전화번호
	`BLOG`        VARCHAR(255) NULL     COMMENT '블로그', -- 블로그
	`REG_DATE`    DATETIME     NULL     COMMENT '가입일', -- 가입일
	`UPDATE_DATE` DATETIME     NULL     COMMENT '변경일', -- 변경일
	`ANO`         INTEGER      NULL     COMMENT '주소번호', -- 주소번호
	`DET_ADDR`    VARCHAR(255) NULL     COMMENT '상세주소', -- 상세주소
	`TAG`         VARCHAR(255) NULL     COMMENT '태그' -- 태그
)
COMMENT '멤버';

-- 멤버
ALTER TABLE `SPMS_MEMBS`
	ADD CONSTRAINT `PK_SPMS_MEMBS` -- 멤버 기본키
		PRIMARY KEY (
			`EMAIL` -- 이메일
		);

-- 멤버사진
CREATE TABLE `SPMS_MEMIMG` (
	`INO`    INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
	`EMAIL`  VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	`IMGURL` VARCHAR(255) NOT NULL COMMENT '사진경로' -- 사진경로
)
COMMENT '멤버사진';

-- 멤버사진
ALTER TABLE `SPMS_MEMIMG`
	ADD CONSTRAINT `PK_SPMS_MEMIMG` -- 멤버사진 기본키
		PRIMARY KEY (
			`INO` -- 사진번호
		);

ALTER TABLE `SPMS_MEMIMG`
	MODIFY COLUMN `INO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '사진번호';

-- 주소정보
CREATE TABLE `SPMS_ADDR` (
	`ANO`      INTEGER      NOT NULL COMMENT '주소번호', -- 주소번호
	`POSTNO`   VARCHAR(10)  NOT NULL COMMENT '우편번호', -- 우편번호
	`BAS_ADDR` VARCHAR(255) NOT NULL COMMENT '기본주소' -- 기본주소
)
COMMENT '주소정보';

-- 주소정보
ALTER TABLE `SPMS_ADDR`
	ADD CONSTRAINT `PK_SPMS_ADDR` -- 주소정보 기본키
		PRIMARY KEY (
			`ANO` -- 주소번호
		);

ALTER TABLE `SPMS_ADDR`
	MODIFY COLUMN `ANO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '주소번호';

-- 프로젝트
CREATE TABLE `SPMS_PRJS` (
	`PNO`        INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`TITLE`      VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
	`CONTENT`    MEDIUMTEXT   NOT NULL COMMENT '내용', -- 내용
	`START_DATE` DATETIME     NOT NULL COMMENT '시작일', -- 시작일
	`END_DATE`   DATETIME     NOT NULL COMMENT '종료일', -- 종료일
	`TAG`        VARCHAR(255) NULL     COMMENT '태그' -- 태그
)
COMMENT '프로젝트';

-- 프로젝트
ALTER TABLE `SPMS_PRJS`
	ADD CONSTRAINT `PK_SPMS_PRJS` -- 프로젝트 기본키
		PRIMARY KEY (
			`PNO` -- 프로젝트번호
		);

ALTER TABLE `SPMS_PRJS`
	MODIFY COLUMN `PNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '프로젝트번호';

-- 프로젝트멤버
CREATE TABLE `SPMS_PRJMEMB` (
	`EMAIL` VARCHAR(50) NOT NULL COMMENT '이메일', -- 이메일
	`PNO`   INTEGER     NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`LEVEL` INTEGER     NULL     DEFAULT 1 COMMENT '레벨' -- 레벨
)
COMMENT '프로젝트멤버';

-- 프로젝트멤버
ALTER TABLE `SPMS_PRJMEMB`
	ADD CONSTRAINT `PK_SPMS_PRJMEMB` -- 프로젝트멤버 기본키
		PRIMARY KEY (
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		);

-- 태스크
CREATE TABLE `SPMS_TASKS` (
	`TNO`        INTEGER      NOT NULL COMMENT '태스크번호', -- 태스크번호
	`PNO`        INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`TITLE`      VARCHAR(255) NOT NULL COMMENT '작업명', -- 작업명
	`UIPROTOURL` VARCHAR(255) NULL     COMMENT 'UI프로토타입', -- UI프로토타입
	`CONTENT`    TEXT         NULL     COMMENT '내용', -- 내용
	`START_DATE` DATETIME     NULL     COMMENT '착수일', -- 착수일
	`END_DATE`   DATETIME     NULL     COMMENT '종료일', -- 종료일
	`STATUS`     INTEGER      NULL     DEFAULT 0 COMMENT '상태' -- 상태
)
COMMENT '태스크';

-- 태스크
ALTER TABLE `SPMS_TASKS`
	ADD CONSTRAINT `PK_SPMS_TASKS` -- 태스크 기본키
		PRIMARY KEY (
			`TNO` -- 태스크번호
		);

ALTER TABLE `SPMS_TASKS`
	MODIFY COLUMN `TNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '태스크번호';

-- 작업할당
CREATE TABLE `SPMS_MEMBTASK` (
	`TNO`   INTEGER     NOT NULL COMMENT '태스크번호', -- 태스크번호
	`EMAIL` VARCHAR(50) NOT NULL COMMENT '이메일', -- 이메일
	`PNO`   INTEGER     NOT NULL COMMENT '프로젝트번호' -- 프로젝트번호
)
COMMENT '작업할당';

-- 작업할당
ALTER TABLE `SPMS_MEMBTASK`
	ADD CONSTRAINT `PK_SPMS_MEMBTASK` -- 작업할당 기본키
		PRIMARY KEY (
			`TNO`,   -- 태스크번호
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		);

-- 피드
CREATE TABLE `SPMS_FEEDS` (
	`FNO`      INTEGER     NOT NULL COMMENT '피드번호', -- 피드번호
	`CONTENT`  TEXT        NOT NULL COMMENT '내용', -- 내용
	`REG_DATE` DATETIME    NOT NULL COMMENT '작성일', -- 작성일
	`EMAIL`    VARCHAR(50) NOT NULL COMMENT '이메일', -- 이메일
	`PNO`      INTEGER     NOT NULL COMMENT '프로젝트번호' -- 프로젝트번호
)
COMMENT '피드';

-- 피드
ALTER TABLE `SPMS_FEEDS`
	ADD CONSTRAINT `PK_SPMS_FEEDS` -- 피드 기본키
		PRIMARY KEY (
			`FNO` -- 피드번호
		);

ALTER TABLE `SPMS_FEEDS`
	MODIFY COLUMN `FNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드번호';

-- 첨부파일
CREATE TABLE `SPMS_FILES` (
	`FNO`      INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
	`FILEID`   VARCHAR(50)  NOT NULL COMMENT '파일아이디', -- 파일아이디
	`TITLE`    VARCHAR(255) NOT NULL COMMENT '파일명', -- 파일명
	`FSIZE`    VARCHAR(20)  NOT NULL COMMENT '파일크기', -- 파일크기
	`REG_DATE` DATETIME     NOT NULL COMMENT '등록일', -- 등록일
	`EMAIL`    VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	`PNO`      INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`TAG`      VARCHAR(255) NULL     COMMENT '태그' -- 태그
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE `SPMS_FILES`
	ADD CONSTRAINT `PK_SPMS_FILES` -- 첨부파일 기본키
		PRIMARY KEY (
			`FNO` -- 파일번호
		);

ALTER TABLE `SPMS_FILES`
	MODIFY COLUMN `FNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 피드파일
CREATE TABLE `SPMS_FEEDFILE` (
	`FEEDNO` INTEGER NOT NULL COMMENT '피드번호', -- 피드번호
	`FILENO` INTEGER NOT NULL COMMENT '파일번호' -- 파일번호
)
COMMENT '피드파일';

-- 피드파일
ALTER TABLE `SPMS_FEEDFILE`
	ADD CONSTRAINT `PK_SPMS_FEEDFILE` -- 피드파일 기본키
		PRIMARY KEY (
			`FEEDNO`, -- 피드번호
			`FILENO`  -- 파일번호
		);

-- 멤버
ALTER TABLE `SPMS_MEMBS`
	ADD CONSTRAINT `FK_SPMS_ADDR_TO_SPMS_MEMBS` -- 주소정보 -> 멤버
		FOREIGN KEY (
			`ANO` -- 주소번호
		)
		REFERENCES `SPMS_ADDR` ( -- 주소정보
			`ANO` -- 주소번호
		);

-- 멤버사진
ALTER TABLE `SPMS_MEMIMG`
	ADD CONSTRAINT `FK_SPMS_MEMBS_TO_SPMS_MEMIMG` -- 멤버 -> 멤버사진
		FOREIGN KEY (
			`EMAIL` -- 이메일
		)
		REFERENCES `SPMS_MEMBS` ( -- 멤버
			`EMAIL` -- 이메일
		);

-- 프로젝트멤버
ALTER TABLE `SPMS_PRJMEMB`
	ADD CONSTRAINT `FK_SPMS_MEMBS_TO_SPMS_PRJMEMB` -- 멤버 -> 프로젝트멤버
		FOREIGN KEY (
			`EMAIL` -- 이메일
		)
		REFERENCES `SPMS_MEMBS` ( -- 멤버
			`EMAIL` -- 이메일
		);

-- 프로젝트멤버
ALTER TABLE `SPMS_PRJMEMB`
	ADD CONSTRAINT `FK_SPMS_PRJS_TO_SPMS_PRJMEMB` -- 프로젝트 -> 프로젝트멤버
		FOREIGN KEY (
			`PNO` -- 프로젝트번호
		)
		REFERENCES `SPMS_PRJS` ( -- 프로젝트
			`PNO` -- 프로젝트번호
		);

-- 태스크
ALTER TABLE `SPMS_TASKS`
	ADD CONSTRAINT `FK_SPMS_PRJS_TO_SPMS_TASKS` -- 프로젝트 -> 태스크
		FOREIGN KEY (
			`PNO` -- 프로젝트번호
		)
		REFERENCES `SPMS_PRJS` ( -- 프로젝트
			`PNO` -- 프로젝트번호
		);

-- 작업할당
ALTER TABLE `SPMS_MEMBTASK`
	ADD CONSTRAINT `FK_SPMS_TASKS_TO_SPMS_MEMBTASK` -- 태스크 -> 작업할당
		FOREIGN KEY (
			`TNO` -- 태스크번호
		)
		REFERENCES `SPMS_TASKS` ( -- 태스크
			`TNO` -- 태스크번호
		);

-- 작업할당
ALTER TABLE `SPMS_MEMBTASK`
	ADD CONSTRAINT `FK_SPMS_PRJMEMB_TO_SPMS_MEMBTASK` -- 프로젝트멤버 -> 작업할당
		FOREIGN KEY (
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		)
		REFERENCES `SPMS_PRJMEMB` ( -- 프로젝트멤버
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		);

-- 피드
ALTER TABLE `SPMS_FEEDS`
	ADD CONSTRAINT `FK_SPMS_PRJMEMB_TO_SPMS_FEEDS` -- 프로젝트멤버 -> 피드
		FOREIGN KEY (
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		)
		REFERENCES `SPMS_PRJMEMB` ( -- 프로젝트멤버
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		);

-- 첨부파일
ALTER TABLE `SPMS_FILES`
	ADD CONSTRAINT `FK_SPMS_PRJMEMB_TO_SPMS_FILES` -- 프로젝트멤버 -> 첨부파일
		FOREIGN KEY (
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		)
		REFERENCES `SPMS_PRJMEMB` ( -- 프로젝트멤버
			`EMAIL`, -- 이메일
			`PNO`    -- 프로젝트번호
		);

-- 피드파일
ALTER TABLE `SPMS_FEEDFILE`
	ADD CONSTRAINT `FK_SPMS_FEEDS_TO_SPMS_FEEDFILE` -- 피드 -> 피드파일
		FOREIGN KEY (
			`FEEDNO` -- 피드번호
		)
		REFERENCES `SPMS_FEEDS` ( -- 피드
			`FNO` -- 피드번호
		);

-- 피드파일
ALTER TABLE `SPMS_FEEDFILE`
	ADD CONSTRAINT `FK_SPMS_FILES_TO_SPMS_FEEDFILE` -- 첨부파일 -> 피드파일
		FOREIGN KEY (
			`FILENO` -- 파일번호
		)
		REFERENCES `SPMS_FILES` ( -- 첨부파일
			`FNO` -- 파일번호
		);
		
		
		
insert into SPMS_MEMBS(EMAIL,MNAME,PWD,TEL)
values('m01@test.com','m01','1111','m01');

insert into SPMS_MEMBS(EMAIL,MNAME,PWD,TEL)
values('m02@test.com','m02','1111','m02');

insert into SPMS_MEMBS(EMAIL,MNAME,PWD,TEL)
values('m03@test.com','m03','1111','m03');		


insert into spms_prjs(title,content,start_date,end_date)
values('project1', 'project1', '2013-1-1', '2013-2-2');

insert into spms_prjs(title,content,start_date,end_date)
values('project2', 'project2', '2013-2-2', '2013-3-2');

insert into spms_prjs(title,content,start_date,end_date)
values('project3', 'project3', '2013-3-1', '2013-4-2');

insert into spms_prjs(title,content,start_date,end_date)
values('project4', 'project4', '2013-4-1', '2013-5-2');

insert into spms_prjs(title,content,start_date,end_date)
values('project5', 'project5', '2013-5-1', '2013-6-2');



/* m01@test.com의 참여프로젝트
1 - 1일반
2 - PL
3 - 일반
*/
insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m01@test.com', 1, 1);

insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m01@test.com', 2, 0);

insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m01@test.com', 3, 1);

/* m02@test.com의 참여프로젝트
2 - 일반
3 - PL
4 - PL
5 - 일반
*/
insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m02@test.com', 2, 1);

insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m02@test.com', 3, 0);

insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m02@test.com', 4, 0);

insert into SPMS_PRJMEMB(EMAIL, PNO, LEVEL)
values('m02@test.com', 5, 1);


alter table SPMS_MEMBS
	add column LEVEL int null default 0;
	
insert into SPMS_MEMBS(EMAIL,MNAME,PWD,TEL,LEVEL)
values('admin01@test.com','admin01','1111','111-2222',1);	


	