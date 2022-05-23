# Q9 --> Solution 

# Step-1 
# Create a new stored procedure using MySQL Workbench and name it 'displaySuppliersDetails'


# Step-2 
# Embed the following block of code within the BEGIN and END statements
# it uses the case statement to check for the type of service based on the ratings(1-5)

select report.supplierDetails,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supplierDetails, supplier.supp_name, final.Average from

(select supplierDetails, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id as supplierDetails, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplierDetails)
as final inner join supplier where final.supplierDetails = supplier.supp_id) as report;


# Step-3
# Invoke the procedure using the following statement
call displaySuppliersDetails();