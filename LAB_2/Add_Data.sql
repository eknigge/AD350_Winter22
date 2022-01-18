-- Add data script

INSERT INTO UserInfo (UserID, FirstName, LastName, City, Zip, Age, Gender, Income, UserInfocol, Country, Email)
	VALUES (1, 'John', 'Doe', 'Los Angeles', '89113', 30, "M", 100000, '', 'USA', 'john@website.com');

INSERT INTO Products (ProductID, ProductName, ProductCost, ProductShortDescription)
	Values (1, 'Sword', 1000, 'Best sword you can buy');
    
INSERT INTO UserProducts (UserID, ProductID, Quantity)
values(1, 1, 1);


