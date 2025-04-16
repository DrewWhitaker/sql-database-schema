/*
*********************************************************************
http://www.mysqltutorial.org
*********************************************************************
Name: MySQL Sample Database classicmodels
Link: http://www.mysqltutorial.org/mysql-sample-database.aspx
Version 3.0
+ changed DATETIME to DATE for some colunmns
Version 2.0
+ changed table type to InnoDB
+ added foreign keys for all tables 
*********************************************************************
*/

UNLOCK TABLES;

DROP SCHEMA IF EXISTS final_project;

CREATE SCHEMA final_project ;

USE final_project;

-- ----------------------------------------------------------------------

/*Table structure for table `territory` */

DROP TABLE IF EXISTS `territory`;

CREATE TABLE `territory` (
  `territory_id` int(11) NOT NULL auto_increment,
  `territory_name` varchar(50) NOT NULL,
  PRIMARY KEY (`territory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `territory` */

LOCK TABLES `territory` WRITE;

insert  into `territory`(`territory_name`) 
VALUES
('All other states'),
('CO, NM, TX'),
('CA'),
('IL, OH, IN'),
('AR, OK, TN'),
('IA, WI, MN'),
('MO, KS, NE')
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------
/*Table structure for table `sales_rep` */

DROP TABLE IF EXISTS `sales_rep`;

CREATE TABLE `sales_rep` (
  `sales_rep_id` int(11) NOT NULL auto_increment,
  `sales_rep_lname` varchar(50) NOT NULL,
  `sales_rep_fname` varchar(50) NOT NULL,
  `territory_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_rep_id`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `sales_rep_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`territory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep` */

LOCK TABLES `sales_rep` WRITE;

insert  into `sales_rep`(`sales_rep_lname`, `sales_rep_fname`, `territory_id`) 
VALUES
('Boyce', 'Raymond', 1),
('Bachman', 'Charles', 2),
('Chen', 'Peter', 3),
('Codd', 'Edgar', 4),
('Ellison', 'Larry', 5),
('Lovelace', 'Ida', 6),
('Tuple', 'Al', 7)
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL auto_increment,
  `customer_name` varchar(50) NOT NULL,
  `sales_rep_id` int(11),
  `bill_to_ship_address` BOOLEAN DEFAULT 0,
  PRIMARY KEY (`customer_id`),
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

LOCK TABLES `customers` WRITE;

insert  into `customers`(`customer_id`, `customer_name`,`sales_rep_id`,`bill_to_ship_address`) 

VALUES
(1122,'Bill & Teds PC repair',3,0),
(1375,"Heston's 10 commands",7,0),
(1376, "Kelsos northtown",7,0),
(1835,"PC Loco",7,0),
(3724,"Databases 'R Us",7,0),
(2298,"Pyramid PC",7,0),
(2376,"Big Freds Mac emporium",7,0),
(1876,"Macs welcome here",7,0),
(2374,"PC master race",7,0),
(1313,"Pulcinella PC",2,0),
(1214,"Abo's workshop",7,0),
(1275,"Cosmic Computer",7,1),
(12,"Avantis Commodore",4,0),
(1728,"Gullivers traveling techs",4,0),
(1818,"Bits & Bytes",4,0),
(1276,"Alma PC connection",5,0),
(1456,"US PC",5,0),
(1568,"Walton Computers",4,0),
(1513,"Algiers applications",6,0),
(1,"Brickhouse Computers",6,0),
(2,"Hometown Help",6,0),
(3,"Michaels Dell Emporium",6,0)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------



/*Table structure for table `sales_rep_territory` */

DROP TABLE IF EXISTS `sales_rep_territory`;

CREATE TABLE `sales_rep_territory` (
  `sales_rep_id` int(11) NOT NULL,
  `territory_id` int(11) NOT NULL,
  KEY `sales_rep_id` (`sales_rep_id`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `sales_rep_territory_ibfk_2` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`),
  CONSTRAINT `sales_rep_territory_ibfk_1` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`territory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep_territory` */

LOCK TABLES `sales_rep_territory` WRITE;

insert  into `sales_rep_territory`(`sales_rep_id`, `territory_id`) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

UNLOCK TABLES;

-- ----------------------------------------------------------------------

/*Table structure for table `titles` */

DROP TABLE IF EXISTS `titles`;

CREATE TABLE `titles` (
  `sales_rep_id` int(11) NOT NULL,
  `title` varchar(20),
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `titles` */

LOCK TABLES `titles` WRITE;

insert  into `titles`(`sales_rep_id`, `title`) 
VALUES
(1, 'VP of Sales'),
(2, 'Salesman'),
(3, 'Salesman'),
(4, 'Salesman'),
(5, 'Salesman'),
(6, 'Saleswoman'),
(7, 'Salesman')
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------


/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_desc` varchar(70) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

LOCK TABLES `products` WRITE;

insert  into `products`(`product_id`, `product_desc`, `unit_price`) 
VALUES
(112, '5 1/4 floppy disks', .75),
(113, '3 1/2 disks', 1.25),
(221, 'Phone support hourly', 75.00),
(222, 'Phone support (family) hourly', 225),
(337, 'User encouragement device (electric)', 74.00),
(338, 'User encouragement device - club style (black)', 52.00),
(339, 'user encourangement device - club style (red)', 60.00),
(443, 'Really fine user manual', 327.00),
(445, 'Motivational poster (framed)', 17.50),
(1007, 'User Tolerance Assistance', 3.14)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------


/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL auto_increment,
  `discount_type` varchar(60) NOT NULL,
  `discount_ratio` decimal(3,2) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

LOCK TABLES `discounts` WRITE;

insert  into `discounts`(`discount_id`, `discount_type`, `discount_ratio`) 
VALUES
(1, '10% discount for qty over 25,000', 0.90),
(2, 'free shipping',0.00);

UNLOCK TABLES;


-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `ship_method`;

CREATE TABLE `ship_method` (
  `ship_method_id` int(11) NOT NULL auto_increment,
  `ship_method_name` varchar(20) NOT NULL,
  `ship_method_terms` varchar(60) NOT NULL,
  `ship_method_ratio` decimal(3,2) NOT NULL,
  PRIMARY KEY (`ship_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ship_method` */

LOCK TABLES `ship_method` WRITE;

insert  into `ship_method`(`ship_method_id`, `ship_method_name`, `ship_method_terms`,`ship_method_ratio`) 
VALUES
(1, 'ups', 'FOB Shipping Point','1'), -- no discount
(2, 'usps', 'FOB Destination Point','1.02'); -- 2% discount

UNLOCK TABLES;

-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `sales_rep_contact`;

CREATE TABLE `sales_rep_contact` (
  `sales_rep_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `zip` int(9),
  
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `sales_rep_contact_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep_contact` */

LOCK TABLES `sales_rep_contact` WRITE;

insert  into `sales_rep_contact`(`sales_rep_id`, `phone`, `address`, `city`, `state`,`zip`) 
VALUES
(1, '816-099-3120', '1 Arrowhead Drive', 'Kansas City', 'MO',64129),
(2, '720-020-2583', '1701 Bryant Street', 'Denver', 'CO', 80204),
(3, '213-003-7427', '1111 South Fibueroa St', 'LA', 'CA',90015),
(4, '773-001-1918', '1060 West Addison', 'Chicago', 'IL',60613),
(5, '615-000-0000', 'Opryland Drive', 'Nashville', 'TN',37214),
(6, '920-020-3232', '1265 Lombardi Avenue', 'Green Bay', 'WI',NULL),
(7, '913-012-3344', '321 Pine St', 'Lawrence', 'KS',66044);

UNLOCK TABLES;

-- ----------------------------------------------------------------------


DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `zip` int(9) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `is_main_address` BOOLEAN DEFAULT 0,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_address` */

LOCK TABLES `customer_address` WRITE;

insert  into `customer_address`(`customer_id`, `address`, `city`, `state`, `zip`,`phone`, `contact_name`, `is_main_address`) 
VALUES
(1122,'111 Santa Anna valley road','Sacremento','CA',94203,'916-101-4443','patricia smith',1),
(1122, '1066 Gayley Ave', 'Los Angeles', 'CA', 90024, '213-1108590','michael williams',0 ),
(1122,'3252 Cahuenga Blvd W', 'Los Angeles', 'CA' , 90068, '213-1278844','james jones',0),
(1375,'1801 Baltimore Ave','Kansas City','MO' , '64108','816-1329745','steve walton',1),
(1376, '300 Armour Rd', 'Kansas City', 'MO', 64116	,'816-1193276', 'john',1),
(1835,'3236 N Rock Rd Ste 120','Wichita','KS',67226,'913-1194780','Mr Rivera',1),
(1835,'1029 Massachusetts St','Lawrence','KS',66044,'913-1296894','david martinez',0),
(3724 ,'775 Normal Lane', 'Relational', 'KS', 66110,'913-999-8877','mary parsons',1),
(3724, '237 Boyce Avenue', 'Codd', 'KS', 67444, '913-787-0000',	'DBA (larry)',0),
(2298, '8600 Amber Hill Ct', 'Lincoln', 'NE'  ,68526	,'402-1933684'	,'maria martinez', 1),
(2376, '1101 S 119th St', 'Omaha', 'NE',  68144,	'402-1015829'	,'william johnson',1),
(1876,'1313 W 3rd St' ,'Alliance', 'NE',69301,'402-1848552','richard johnson',1),
(2374,'3457 Holdrege St' ,'Lincoln','NE',68503,'402-1363385','james anderson',1),
(2374, '1423 O St', 'Lincoln', 'NE' ,68508,'402-106-2464','robert taylor',0),
(1313,'1119 W Drake Rd', 'Fort Collins', 'CO' , 80526	,'720-123-8253'	,'robert white',1),
(1214,'2220 Wildcat Reserve', 'Littleton', 'CO' , 80129,	'720-199-5071'	,'william wilson',1),
(1275	,'550 Grant St', 'Denver', 'CO',  80203	,'720-195-3583',	'david lee', 1),
(1275 ,'8243 S Holly St', 'Littleton', 'CO',  80122	,'720-150-0684',	'richard jones', 0),
(12, '3702 N Broadway St', 'Chicago', 'IL'  ,60613	,'312-105-6547',	'susan anderson',1),
(1728	,'1512 W Berwyn Ave', 'Chicago', 'IL' , 60640	,'312-121-6247',	'patricia white',1),
(1728, '2343 W Chicago Ave' ,'Chicago', 'IL'  ,60622	,'312-135-4336',	'jennifer jackson',0),
(1818,	'1919 W Montrose Ave' ,'Chicago', 'IL' , 60613,	'312-103-3217',	'barbara moore',1),
(1818,'2171 N Milwaukee Ave', 'Chicago', 'IL',  60647	,'312-190-6821',	'daniel thomas',0),
(1276,'621 Highway 71 N', 'Alma', 'AR',  72921,	'501-1977233'	,'elizabeth davis',1),
(1456,	'4203 E Kiehl Ave', 'Sherwood', 'AR', 72120,	'501-1562950',	'linda wilson',1),
(1568,	'109 Commons Dr', 'Maumelle', 'AR',  72113	,'501-1654094'	,'richard garcia',1),
(1568, '1068 Markham St', 'Conway', 'AR',  72032,	'501-1904227',	'joseph martin',0),
(1513,'6305 Mills Civic Pkwy Ste 3111 West','Des Moines','IA',50266,'515-1003458','michael white',1),
(1, '110 E Water St', 'Decorah', 'IA',  52101,	'515-1445162',	'robert thomas',1),		
(2,'5 S Dubuque St', 'Iowa City', 'IA' , 52240,	'515-1059426'	,'barbara johnson',1),
(3,'2100 Norcor Ave' ,'Coralville', 'IA' , 52241,	'515-1766395',	'susan smith',1),
(3,'106 1st St SW', 'Mount Vernon', 'IA',  52314	,'515-1304468'	,'robert thompson',0)
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------


/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `payment_due` date NOT NULL,
  `delivery_date` date,
  `payment_terms` varchar(30),
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `ship_method_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `address_id` (`address_id`),
  KEY `ship_method_id` (`ship_method_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`address_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ship_method_id`) REFERENCES `ship_method` (`ship_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

insert  into `orders`(`payment_due`, `delivery_date`, `payment_terms`, `customer_id`, `address_id`, `ship_method_id`) 
VALUES
('2020-12-18','2020-11-30','net30',3724,9,1)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------


/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL auto_increment,
  `quantity` int(11) NOT NULL,
  `is_discount_approved` BOOLEAN DEFAULT 0,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount_id` int(11),
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

LOCK TABLES `order_details` WRITE;

insert  into `order_details`( `order_id`, `quantity`, `product_id`,`is_discount_approved`,`unit_price`, `discount_id`) 
VALUES
(1,23,443,0,327,NULL),
(1,4,337,0,74,NULL),
(1,44000,1007,1,3.14,1)
;
UNLOCK TABLES;


-- ----------------------------------------------------------------------
#Queries for invoice

-- Select columns to retrieve information about orders, customers, billing and shipping details, 
-- sales representatives, payment terms, delivery methods, and the calculated order total.
SELECT 
	orders.order_id, -- Retrieves the unique identifier for each order.
    customers.customer_name, -- Retrieves the name of the customer who placed the order.
    customers.customer_id, -- Retrieves the unique identifier of the customer.
    
    -- Concatenates the last name and first name of the sales representative into a single string.
    CONCAT(sales_rep.sales_rep_lname, ', ', sales_rep.sales_rep_fname) AS sales_rep, 
    
    -- Determines the billing address for the customer.
    -- If the customer has the same billing and shipping address (bill_to_ship_address=1), use the current address.
    -- Otherwise, retrieve the main address (is_main_address=1) for the customer.
    CASE 
		WHEN customers.bill_to_ship_address=1 THEN 
            CONCAT(customer_address.address, ', ', city, ' ', state, ', ', zip) 
        ELSE 
            (SELECT CONCAT(customer_address.address, ', ', city, ' ', state, ', ', zip) 
             FROM customer_address
             WHERE customer_address.is_main_address=1 
             AND customer_address.customer_id=customers.customer_id)
    END AS billing_address,
	
	-- Determines the billing phone number using the same logic as the billing address:
    -- If bill_to_ship_address=1, use the current phone; otherwise, retrieve the phone of the main address.
	CASE 
		WHEN customers.bill_to_ship_address=1 THEN 
            customer_address.phone
        ELSE 
            (SELECT customer_address.phone 
             FROM customer_address
             WHERE customer_address.is_main_address=1 
             AND customer_address.customer_id=customers.customer_id)
    END AS billing_phone,

	orders.payment_due, -- Retrieves the payment due date for the order.
    
    -- Concatenates the last name and first name of the sales representative (repeated column, potentially redundant).
    CONCAT(sales_rep.sales_rep_lname, ', ', sales_rep.sales_rep_fname) AS sales_rep_name, 
    
    orders.payment_terms, -- Retrieves the payment terms for the order (e.g., Net 30, prepaid).
    
    customer_address.contact_name AS recipient_name, -- Retrieves the contact name for the shipping recipient.
    
    -- Concatenates the shipping address components (street address, city, state, and zip code).
    CONCAT(customer_address.address, ', ', city, ' ', state, ', ', zip) AS ship_address,
    
    customer_address.phone AS shipping_phone, -- Retrieves the phone number for the shipping address.
    orders.delivery_date, -- Retrieves the delivery date for the order.
    
    ship_method.ship_method_name, -- Retrieves the name of the shipping method (e.g., FedEx, UPS).
    ship_method.ship_method_terms, -- Retrieves the terms of the shipping method (e.g., 2-day shipping).
    
    -- Calculates the total order value:
    -- 1. Multiply quantity by unit price for each product.
    -- 2. Apply a discount ratio if a discount is approved (is_discount_approved=1).
    -- 3. Multiply the result by the shipping method's ratio to account for additional costs.
    -- 4. Use FORMAT to format the result as a decimal with two places.
    FORMAT(
        SUM(order_details.quantity * products.unit_price * 
            (CASE 
                WHEN order_details.is_discount_approved=1 THEN 
                    discounts.discount_ratio 
                ELSE 
                    1 -- No discount applied.
            END)) 
        * ship_method.ship_method_ratio, 2) AS order_total -- Final total amount for the order.
FROM orders
    -- Join the `customers` table to get customer details for each order.
    JOIN customers ON orders.customer_id = customers.customer_id
    
    -- Join the `order_details` table to get information about individual products in the order.
    JOIN order_details ON orders.order_id = order_details.order_id
    
    -- Join the `products` table to retrieve product details such as unit price.
    JOIN products ON order_details.product_id = products.product_id
    
    -- Join the `sales_rep` table to associate the sales representative with the customer.
    JOIN sales_rep ON customers.sales_rep_id = sales_rep.sales_rep_id
    
    -- Join the `customer_address` table to retrieve shipping address and contact details for the order.
    JOIN customer_address ON orders.address_id = customer_address.address_id
    
    -- Use a LEFT JOIN to the `discounts` table to account for the possibility of no discounts on some line items.
    LEFT JOIN discounts ON order_details.discount_id = discounts.discount_id
    
    -- Join the `ship_method` table to retrieve details about the shipping method.
    JOIN ship_method ON orders.ship_method_id = ship_method.ship_method_id
;




-- Select key information about each order's line items, including order details, product information, 
-- applicable discounts, and the calculated total for each line item.
SELECT 
	order_details.order_id, -- The unique identifier for the order associated with this line item.
	order_details.quantity, -- The quantity of the product ordered in this line item.
    order_details.product_id, -- The unique identifier for the product in this line item.
    products.product_desc, -- A description of the product for better readability and understanding.
    order_details.quantity, -- (Repeated) The quantity of the product ordered in this line item.
    order_details.unit_price, -- The price per unit of the product in this line item.

    -- Determine the type of discount applied:
    -- If the discount is approved (is_discount_approved=1), retrieve the discount type (e.g., percentage or fixed value).
    -- Otherwise, return 0 to indicate that no discount is applied.
    (CASE 
		WHEN order_details.is_discount_approved = 1 THEN discounts.discount_type 
        ELSE 0 
    END) AS discount,

    -- Calculate the total value for the line item:
    -- 1. Multiply the quantity by the unit price.
    -- 2. Apply the discount multiplier if a discount is approved.
    -- 3. Format the result as a decimal value with two decimal places for financial precision.
	FORMAT(order_details.quantity * order_details.unit_price * 
		(CASE 
			WHEN order_details.is_discount_approved = 1 THEN 
                discounts.discount_ratio -- Apply the discount ratio if a discount is approved.
			ELSE 
                1 -- No discount applied, so the multiplier is 1 (full price).
		END), 2) AS line_total

-- From the order_details table, which contains individual line items for orders.
FROM order_details
    -- Join with the orders table to associate each line item with its respective order.
    JOIN orders ON order_details.order_id = orders.order_id

    -- Join with the products table to retrieve additional details about the product (e.g., description, price).
    JOIN products ON order_details.product_id = products.product_id

    -- Left join with the discounts table to include discount information for each line item, 
    -- allowing for the possibility that some line items do not have an associated discount.
    LEFT JOIN discounts ON order_details.discount_id = discounts.discount_id

-- Order the results by order ID to group line items by the respective order for easier analysis.
ORDER BY order_details.order_id;
