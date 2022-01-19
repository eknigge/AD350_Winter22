-- Add data script

-- Create user table
INSERT INTO UserInfo (UserID, FirstName, LastName, City, Zip, Age, Gender, Income, UserInfocol, Country, Email)
	VALUES (1, 'John', 'Doe', 'Los Angeles', '89113', 30, "M", 100000, '', 'USA', 'john@website.com'),
	(2, 'Sally', 'Johnson', 'Seattle', '45132', 80, "F", 37000, '', 'USA', 'sally@hotmail.com'),
    (3, 'Bob', 'Dowel', 'Washington DC', '11234', 50, "M", 200000, '', 'USA', 'bob@bob.com'),
    (4, 'James', 'Demore', 'Portland', '12345', 18, "M", 52000, '', 'USA', 'james@tv.com'),
    (5, 'Laura', 'Thompson', 'Boise', '75423', 24, "F", 48000, '', 'USA', 'laura@gmail.com'),
    (6, 'Bailey', 'Anderson', 'Sacramento', '27464', 34, "N", 120000, '', 'USA', 'Bailey@website.com');

-- Link users to Social Network ID
INSERT INTO SocialNetworks (SocialNetworkID, UserInfo_UserID)
	VALUES (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);

-- Sample add Products
INSERT INTO Products (ProductID, ProductName, ProductCost, ProductShortDescription)
	Values (1, 'Sword', 1000, 'Best sword you can buy');

-- Sample add UserProducts    
INSERT INTO UserProducts (UserID, ProductID, Quantity)
values(1, 1, 1);

-- Sample add Facebooks
INSERT INTO Facebook (FacebookUserID, ProfileName, Attribute_1, Attribute_2, SocialNetworkID)
values (1, 'John Doe', '','', 1),
(2, 'Sally Johnson', '','', 2),
(3, 'Bob Dowel', '','', 3),
(4, 'James Demore', '','', 4),
(5, 'Laura Thompson', '','', 5),
(6, 'Bailey Anderson', '','', 6);

-- Sample add FacebookPosts
INSERT INTO FacebookPosts (PostID, PostText, Facebook_FacebookUserID)
values (1, 'Sunrise', 1),
(2, 'Good Morning', 2),
(3, 'Los Cabos', 3),
(4, 'La Sinaloa', 4),
(5, 'Bon Appetit', 5),
(6, 'Gloomy', 6);

select * from Facebook;
select * from FacebookPosts;

