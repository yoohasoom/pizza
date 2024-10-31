CREATE TABLE TBL_PIZZA_03 (
    pcode CHAR(4) PRIMARY KEY NOT NULL,
    pname VARCHAR2(30),
    cost NUMBER(7)
);

INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA01', '고르곤졸라피자', 6000);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA02', '치즈피자', 6500);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA03', '페퍼로니피자', 7000);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA04', '콤비네이션피자', 7500);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA05', '고구마피자', 6000);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA06', '포테이토피자', 7000);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA07', '불고기피자', 8000);
INSERT INTO TBL_PIZZA_03 (pcode, pname, cost) VALUES ('AA08', '내추럴피자', 8000);

CREATE TABLE TBL_SHOP_03 (
    scode CHAR(4) PRIMARY KEY NOT NULL,
    sname VARCHAR2(20)
);

INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S001', '강남점');
INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S002', '강서점');
INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S003', '강동점');
INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S004', '영등포점');
INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S005', '시청점');
INSERT INTO TBL_SHOP_03 (scode, sname) VALUES ('S006', '인천점');

CREATE TABLE TBL_SALELIST_03 (
    saleno NUMBER(7) PRIMARY KEY NOT NULL,
    scode CHAR(4) NOT NULL,
    saledate DATE,
    pcode CHAR(4) NOT NULL,
    amount NUMBER(5),
    FOREIGN KEY (scode) REFERENCES TBL_SHOP_03(scode),
    FOREIGN KEY (pcode) REFERENCES TBL_PIZZA_03(pcode)
);

INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100001, 'S001', TO_DATE('2018-12-02', 'YYYY-MM-DD'), 'AA01', 50);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100002, 'S001', TO_DATE('2018-12-02', 'YYYY-MM-DD'), 'AA02', 30);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100003, 'S001', TO_DATE('2018-12-02', 'YYYY-MM-DD'), 'AA03', 20);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100004, 'S003', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA01', 40);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100005, 'S003', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA03', 60);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100006, 'S004', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA04', 70);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100007, 'S005', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA05', 80);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100008, 'S005', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA04', 50);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100009, 'S006', TO_DATE('2018-12-03', 'YYYY-MM-DD'), 'AA06', 50);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100010, 'S005', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA03', 20);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100011, 'S002', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA05', 30);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100012, 'S002', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA01', 20);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100013, 'S001', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA02', 40);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100014, 'S001', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA03', 40);
INSERT INTO TBL_SALELIST_03 (saleno, scode, saledate, pcode, amount) VALUES (100015, 'S004', TO_DATE('2018-12-04', 'YYYY-MM-DD'), 'AA06', 50);


select sa.saleno, sh.scode, sh.sname, sa.saledate, p.pcode, p.pname, sa.amount, (p.cost * amount) as total from tbl_pizza_03 p, tbl_shop_03 sh, tbl_salelist_03 sa where p.pcode = sa.pcode and sh.scode = sa.scode order by saleno

SELECT 
    sh.scode, 
    sh.sname, 
    SUM(p.cost * sa.amount) AS total 
FROM 
    tbl_pizza_03 p
JOIN 
    tbl_salelist_03 sa ON p.pcode = sa.pcode
JOIN 
    tbl_shop_03 sh ON sh.scode = sa.scode
GROUP BY 
    sh.scode, 
    sh.sname;


    drop table users;
    create table users(
    id varchar2(10) not null primary key,
    username varchar2(30),
    password varchar2(30),
    
    );
