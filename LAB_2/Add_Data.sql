/*
Add data script. Populates all tables with at least 5 records
*/

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

-- Add Products
INSERT INTO Products (ProductID, ProductName, ProductCost, ProductShortDescription)
	Values 
		(1, 'Sword', 1000, 'Best sword you can buy'),
		(2, 'block of cheese', 20, 'imported parmesan'),
		(3, 't-shirt', 10, 'plain white t-shirt'),
		(4, 'talisman', 100000, 'ultra-rare gold and diamond talisman'),
        (5, 'fish food', 10, 'fish food for salt water fish');

-- Add UserProducts    
INSERT INTO UserProducts (UserID, ProductID, Quantity)
	VALUES
    (1, 1, 1),
    (1, 3, 1),
    (2, 2, 2),
    (3, 3, 5),
    (4, 4, 1),
    (5, 5, 1),
    (6, 3, 1);
    
-- Add Services
INSERT INTO Services (ServiceID, ServiceName, ServiceCost, ServiceShortDescription)
	Values
    (1, 'Haircut', 50, 'high-end haircut at reputable salon'), 
    (2, 'House cleaning', 100, '2 hour house cleaning'),
    (3, 'Car wash', 10, 'drive-through car wash'),
    (4, 'Massage', 80, 'standard massages, includes gratuity'),
    (5, 'Dry cleaning', 30, 'per garmet');
    
-- Add UserServices
INSERT INTO UserServices(UserID, ServiceID, Quantity)
	VALUES 
    (1, 1, 1),
    (1, 3, 2),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 4, 2);

-- Test Query for User Products
SELECT * 
FROM UserInfo
JOIN UserProducts 
	ON UserInfo.UserID = UserProducts.UserID
JOIN Products
	ON Products.ProductID = UserProducts.ProductID
WHERE UserInfo.USerID = 1;

-- Test Query for User Services
SELECT *
FROM UserInfo
JOIN UserServices
	ON UserInfo.UserID = UserServices.UserID
JOIN Services
	ON Services.ServiceID = UserServices.ServiceID
WHERE UserInfo.UserID = 1;

-- Add Instagram Accounts
INSERT INTO Instagram(InstagramID, ProfileName, Attribute_1, Attribute_2, SocialNetworkID)
    VALUES  
    (1, 'jdoe', 'great hair', 'likes cats', 1),
    (2, 'sjohnson', 'fun', 'likes cats', 2),
    (3, 'bdawesome', 'silly', 'likes cats', 3),
    (4, 'jdemore', 'likes the color green', 'likes cats', 4),
    (5, 'lathompson', 'dislikes cheesecake', 'likes cats', 5),
    (6, 'baileyanders', 'tickles monkeys', 'likes cats', 6);

-- Add Instagram Posts
INSERT INTO InstragramPost(idInstragramPost, Picture, PostText, Instagram_InstagramID)
    VALUES
    (1, '', 'post from user 1', 1),
    (2, '', 'post from user 2', 2),
    (3, '', 'post from user 3', 3),
    (4, '', 'post from user 4', 4),
    (5, '', 'post from user 5', 5),
    (6, '', 'post from user 6', 6);

-- Test Query for Instagram Accounts
SELECT * 
FROM UserInfo
JOIN SocialNetworks
    ON UserInfo.UserID = SocialNetworks.UserInfo_UserID
JOIN Instagram  
    ON SocialNetworks.SocialNetworkID = Instagram.SocialNetworkID
JOIN InstragramPost
    ON InstragramPost.idInstragramPost = Instagram.InstagramID
WHERE UserID = 1;