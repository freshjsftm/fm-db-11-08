---1 nf----
DROP TABLE "test";
CREATE TABLE "test"(
  pr1 varchar(64),
  pr2 INT,
  PRIMARY KEY (pr1, pr2)
);


---2 nf----
CREATE TABLE "positions"(
  "id" SERIAL  PRIMARY KEY,
  "name",
  "isCar"
);
CREATE TABLE "workers"(
  "id" SERIAL  PRIMARY KEY,
  "name",
  "department",
  "positionId" REFERENCES,  
);
INSERT INTO "positions" ("name","isCar")
VALUES ('HR',FALSE),('clear',FALSE),('driver',TRUE)

INSERT INTO "workers"("name","department","positionId")
VALUES ('Elon','xs',1);

---3 nf----
CREATE TABLE "positions"(
  "id" SERIAL  PRIMARY KEY,
  "name",
  "isCar"
);
CREATE TABLE "departments"(
  "id" SERIAL  PRIMARY KEY,
  "name",
  "phoneDepartament"
);
CREATE TABLE "workers"(
  "id" SERIAL  PRIMARY KEY,
  "name",
  "departmentId" REFERENCES,
  "positionId" REFERENCES,  
);
INSERT INTO "departments" ("name","phoneDepartament")
VALUES ('cc','123'),('xs','143');
INSERT INTO "positions" ("name","isCar")
VALUES ('HR',FALSE),('clear',FALSE),('driver',TRUE)
INSERT INTO "workers"("name","departmentId","positionId")
VALUES ('Elon',2,1);


----4 nf-----
CREATE TABLE "doctors"(
  "id" SERIAL  PRIMARY KEY,
  "name"
);
CREATE TABLE "ills"(
  "id" SERIAL  PRIMARY KEY,
  "name"
);

CREATE TABLE "d_t_i"(
  "dId" SERIAL  PRIMARY KEY,
  "iId" SERIAL  PRIMARY KEY,
  "diagnoz"
)

INSERT INTO "d_t_i" 
VALUES 
(1,1,'d1'),
(1,2,'d1'),
(2,1,'d2')