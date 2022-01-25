-- Test Queries for Validating Add_Data

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
