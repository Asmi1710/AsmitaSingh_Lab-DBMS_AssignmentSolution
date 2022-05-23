# Solution to Questions in Lab 4

#  Creating a database "e-commerce" and making it "default schema"

# Q1--> creating tables for supplier, customer, category, product, supplier_pricing,order, rating to store the data for the E- commerce with the given schema definition
# creating supplier table
create table if not exists `supplier`(
`SUPP_ID` int primary key ,
`SUPP_NAME` varchar(50) NOT NULL,
`SUPP_CITY` varchar(50) NOT NULL,
`SUPP_PHONE` varchar(50) NOT NULL
);


# creating customer table
create table if not exists `customer`(
`CUS_ID` int primary key,
`CUS_NAME` VARCHAR(20) NOT NULL,
`CUS_PHONE` VARCHAR(10) NOT NULL,
`CUS_CITY` VARCHAR(30) NOT NULL,
`CUS_GENDER` char
);

# creating category table
create table if not exists `category`(
`CAT_ID` int primary key, 
`CAT_NAME` VARCHAR(20) NOT NULL
); 

# creating product table
create table if not exists `product`(
`PRO_ID` int primary key, 
`PRO_NAME` VARCHAR(20) NOT NULL DEFAULT "Dummy Product",
`PRO_DESC` VARCHAR(60),
`CAT_ID` int not null,
FOREIGN KEY (`CAT_ID`) REFERENCES CATEGORY (`CAT_ID`)
);

# creating supplier_pricing table
create table if not exists `supplier_pricing`(
`PRICING_ID` int NOT NULL primary key,
`PRO_ID` int NOT NULL,
`SUPP_ID` int NOT NULL, 
`SUPP_PRICE` int DEFAULT 0,
FOREIGN KEY (`PRO_ID`) REFERENCES product (`PRO_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier (`SUPP_ID`)
);

# creating order table
CREATE TABLE IF NOT EXISTS `order`(
ORD_ID int primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID int not null, 
PRICING_ID int not null,
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER (CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID)
);

# creating rating table
create table if not exists rating(
RAT_ID int primary key,
ORD_ID int not null, 
RAT_RATSTARS  INT NOT NULL,
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);


# Q2-> Insert the given data in the tables created

# inserting data into supplier table
insert into supplier values (1, "Rajesh Retails", "Delhi", 1234567890);
insert into supplier values (2, "Appario Ltd.", "Mumbaii", 2589631470);
insert into supplier values (3, "Knome products", "Banglore", 9785462315);
insert into supplier values (4, "Bansal Retails", "Kochi", 8975463285);
insert into supplier values (5, "Mittal Ltd.", "Lucknow", 7898456532);

# inserting data into customer table
insert into customer values (1, "AAKASH",9999999999, "DELHI", "M");
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');


# inserting data into category table
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");


# inserting data into product table
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);


# inserting data into supplier_pricing table

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);


# inserting data into order table

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-01-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

# inserting data into rating table

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


# Q3-> Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
# Uses inner join between tables customer and  order and also places condition of order amount > Rs 3000 and 
# groups final result by customers' gender 

select count(cus_gender) as TotalNoOfCustomers, cus_gender 
from 
(
select cus_gender, cus_name from customer as cus
inner join
(
select ord_id, cus_id from `order` where ord_amount >= '3000'
)
as o
on cus.cus_id = o.cus_id
group by cus.cus_id
)
as T
group by cus_gender;


# Q4 -> Display all the orders along with product name ordered by a customer having Customer_Id=2
# It lists Customer's name, order ID, Order date, Product ID and Product Name 
# It uses the tables order, customer, product and supplier_pricing for this data
# It uses "where" clause to place conditions of matching customer ID between cutomer and order tables, pricing ID between supplier_pricing and order tables and 
# matching product ID between product and supplier_pricing tables.
 
select cus.CUS_NAME, ord.ORD_ID, ord.ORD_DATE, pr.PRO_ID, pr.PRO_NAME from customer as cus, `order` as ord, product as pr, Supplier_pricing as sp where cus.cus_id=2 and ord.CUS_ID=cus.CUS_ID and ord.PRICING_ID=sp.PRICING_ID and pr.PRO_ID=sp.PRO_ID;



# Q5-> Display the Supplier details who can supply more than one product.
# It lists Supplier ID, name, city and phone number of those who supply more than one product by using
# inner join between supplier and supplier_pricing tables and condition of count of supplier_ID in pricing table being more than 1


select sup.SUPP_ID, supp_name, supp_city, supp_phone 
from supplier as sup
inner join
(
select SUPP_ID, count(SUPP_ID) from supplier_pricing group by 
SUPP_ID having count(supp_id) > 1 
) as sp
on sup.supp_id = sp.supp_id; 



# Q6-> Find the least expensive product from each category and print the table with category id, name, product name and price of the product

select cat.CAT_ID, CAT_NAME, PRO_ID, PRO_NAME, min(MIN_PRICE) from category as cat
inner join
(
select prod.PRO_ID, PRO_NAME, CAT_ID, MIN_PRICE from product as prod
inner join
(select pro_id as PRO_ID, min(supp_price) as MIN_PRICE from supplier_pricing 
group by PRO_ID) as sp
on prod.pro_id = sp.pro_id)
as pro_sp
on cat.cat_id = pro_sp.CAT_ID
group by cat_id;


# Q7-> Display the Id and Name of the Product ordered after “2021-10-05”.
# It displays Product ID, name and order date for those products ordered after 2021-10-05
# It uses inner join between product and supplier_pricing tables and 
# condition on order date in supplier_pricing table 


select pr.PRO_ID, pr.PRO_NAME, ord_pr.ORD_DATE from product as pr 
INNER JOIN 
( select sp.PRO_ID, sp.PRICING_ID, ord.ORD_DATE FROM supplier_pricing as sp 
INNER JOIN 
`order` as ord on sp.PRICING_ID= ord.PRICING_ID  where ord.ORD_DATE> "2021-10-05")  
as ord_pr 
on pr.PRO_ID= ord_pr.PRO_ID;



# Q8-> Display customer name and gender whose names start or end with character 'A'.
# It displays cusotmers' name and gender from customer table and 
# uses condition ('where' clause) to check if it starts or ends with A (using 'like' clause and '%' ) 

select CUS_NAME, CUS_GENDER from customer where CUS_NAME like "a%" or CUS_NAME like "%a";


# Q9-> Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, 
# print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

# refer to next file for the code 

call displaySuppliersDetails();
