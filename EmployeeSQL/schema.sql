-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE "employee" (
    "id" int   NOT NULL,
    "title_id" varchar   NOT NULL,
    "dob" date   NOT NULL,
    "f_name" varchar   NOT NULL,
    "l_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "title" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salary" (
    "emp_id" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "dept" (
    "dept_id" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_dept" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_id" varchar   NOT NULL,
    "emp_id" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_id","emp_id"
     )
);

CREATE TABLE "dept_employee" (
    "emp_id" int   NOT NULL,
    "dept_id" varchar   NOT NULL,
    CONSTRAINT "pk_dept_employee" PRIMARY KEY (
        "emp_id","dept_id"
     )
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("title_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept" ("dept_id");

-- Validate data
select * from dept;
select * from title;
select * from employee;
select * from salary;
select * from dept_employee;
select * from dept_manager;