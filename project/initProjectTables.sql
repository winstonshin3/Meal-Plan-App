DROP TABLE R1;
-- DROP TABLE R2;
-- DROP TABLE R3;
-- DROP TABLE R4;
-- DROP TABLE R5;
-- DROP TABLE R6;
-- DROP TABLE R7;
-- DROP TABLE R8;
-- DROP TABLE R9;
-- DROP TABLE R10;
-- DROP TABLE R11;
-- DROP TABLE R12;
-- DROP TABLE R13;
-- DROP TABLE R14;
-- DROP TABLE R15;

CREATE TABLE R1(
nutritionalReqID INT PRIMARY KEY,
nutritionalReqTotalSugars INT,
nutritionalReqTotalFats INT,
nutritionalReqTotalProteins INT,
nutritionalReqTotalCalories INT
);

INSERT INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories) VALUES(156, 250, 40, 48, 1700);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(460, 300, 55, 70, 2400);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(416, 483, 65, 280, 3400);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(233, 367, 46, 211, 2400);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(521, 280, 44, 120, 2000);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(406, 275, 50, 100, 2400);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(510, 225, 49, 60, 1900);

INSERT
INTO R1(nutritionalReqID, nutritionalReqTotalSugars, nutritionalReqTotalFats, nutritionalReqTotalProteins, nutritionalReqTotalCalories)
VALUES(220, 210, 43, 120, 1800);

SELECT * FROM R1 WHERE nutritionalReqID = 460;


CREATE TABLE R2(
	uid 		INT		PRIMARY KEY,
	uname 	VARCHAR,
	uaddress	VARCHAR,
budget 	INT,
phone  	CHAR(13),
nutritionalReqID INT,
FOREIGN KEY (nutritionalReqID) REFERENCES R1(nutritionalReqID), 
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(131, 'Jennifer', '335 Elbing street', 150, '778-365-7145', 156);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(168, 'David', '1743 Grey Avenue', 120, '778-563-9865', 460);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(189, 'Chadwick', '8987 Webber street', 400, '778-451-2333', 416);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(457, 'Mathew', '133 14th street', 200, '236-446-3535', 233);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(381, 'Victoria', '8763 cross drive', 600, '778-867-9025', 521);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(201, 'Ethan', '5418 cross drive', 260, '604-379-6581', 406);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(042, 'Peggy', '687 14th Avenue East', 350, '778-981-3630', 510);

INSERT
INTO R2(uid, uname, uaddress, budget, phone, nutritionalReqID)
VALUES(055, 'Cindy', '8763 Sexsmith drive', 300, '236-856-7975', 220);


CREATE TABLE R3(
	uid 			INT,
	mealPlanName 	VARCHAR,
	duration		INT,
date 			VARCHAR,
PRIMARY KEY (uid, mealPlanName),
FOREIGN KEY (uid) REFERENCES R2(uid), 
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(131, 'regular daily', 49, '2023-06-07');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(168, 'regular daily', 42, '2023-06-07');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(189, 'bulking', 30, '2023-11-11');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(457, 'low fat', 27, '2024-01-12');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(381, 'regular daily', 30, '2023-08-15');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(406, 'regular daily', 30, '2023-03-10');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(510, 'protein focused', 21, '2023-05-14');

INSERT
INTO R3(uid, mealPlanName, duration, date)
VALUES(220, 'international daily', 14, '2023-12-23');


CREATE TABLE R4(
	mealName	VARCHAR	PRIMARY KEY,
	diningTime 	INT,
	mealCuisine	VARCHAR
);

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Steak with asparagus and potatoes', 40, 'Italian');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Caesar salad with chicken breast', 25, 'American');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Beef stir fry noodles', 30, 'Chinese');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Kimchi fried rice', 20, 'Korean');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Burger and Fries', 25, 'American');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('French toast', 15, 'French');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Bibimbap and kimchi', 25, 'Korean');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Lasagna and garlic bread', 25, 'Italian');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Carbonara and lemonade', 25, 'Italian');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('French onion soup and baguette', 25, 'French');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Crispy char siu and soy sauce chicken over rice', 30, 'Chinese');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Baby back ribs with fries', 30, 'American');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Peking duck with steamed pancake and stir fried vegetables', 30, 'Chinese');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Fruit smoothie and oats', 5, 'American');


INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Tuna sandwich and fresh squeezed fruit juice', 15, 'American');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Pasta salad and lemonade', 15, 'Italian');

INSERT
INTO R4(mealName, diningTime, mealCuisine)
VALUES('Korean fried chicken and beer', 25, 'Korean');


CREATE TABLE R5(
	foodName		VARCHAR	PRIMARY KEY,
	foodCost 		INT,
	nutritionalFactName	VARCHAR,
	discount		INT,
	timeRequired		INT,
	UNIQUE (nutritionalFactName)
	FOREIGN KEY (nutritionalFactName) REFERENCES R6(nutritionalFactName),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Steak', 20, 'Steak', NULL, 30);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Asparagus', 3, 'Asparagus', NULL, 12);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Baked potatoes', 4, 'Baked potatoes', NULL, 20); 



INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Caesar salad', 6, 'Caesar salad', NULL, 10);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Roast chicken breast', 8, 'Roast chicken breast', NULL, 15); 

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Greek yogurt', 4, 'Greek yogurt', NULL, 0);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Roast oats', 2,  'Roast oats', NULL, 10);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Beef noodle stir fry', 10, 'beef noodle stir fry', 15, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Kimchi fried rice', 12, 'Kimchi fried rice', NULL, 30);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Pickled radish', 2, 'Pickled radish', NULL, 0);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Burger', 6, 'Burger', NULL, 20);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('French fries', 4, 'French fries', NULL, 30);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('French toast', 4, 'French toast', NULL, 15);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Bibimbap', 12, 'Bibimbap', NULL, 30);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Kimchi', 1, 'Kimchi', NULL, 0);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Lasgna', 15, 'beef noodle stir fry', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Garlic bread', 3, 'Garlic bread', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Carbonara', 12, 'Carbonara', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Lemonade', 2, 'Lemonade', NULL, 5);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('French onion soup', 12, 'French onion soup', 0, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Baguette', 2, 'Baguette', 30, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Crispy char siu', 12, 'Crispy char siu', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Soy sauce chicken', 12, 'Soy sauce chicken', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Steamed rice', 2, 'Steamed rice', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Baby back ribs', 29, 'Baby back ribs', 0, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Crispy char siu', 12, 'Crispy char siu', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Peking duck', 40, 'Peking duck', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Steamed pancake', 3, 'Steamed pancake', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Vegetable stir fry', 10, 'Vegetable stir fry', 10, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Fruit smoothie', 5, 'Fruit smoothie', NULL, 10);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('tuna sandwich', 8, 'Tuna sandwich', NULL, 12);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Fresh squeezed fruit juice', 5, 'Fresh squeezed fruit juice', NULL, 15);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Pasta salad', 6, 'Pasta salad', NULL, 20);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Korean fried chicken', 19, 'Fresh squeezed fruit juice', 15, NULL);

INSERT
INTO R5(foodName, foodCost, nutritionalFactName, discount, timeRequired)
VALUES('Beer', 4, 'Beer', 0, NULL);




CREATE TABLE R6(
	nutritionalFactName		VARCHAR	PRIMARY KEY,
	nutritionalFactTotalProteins 	INT,
	nutritionalFactTotalSugars	INT,
	nutritionalFactTotalFats	INT,
	nutritionalFactTotalCalories	INT,
	foodName			VARCHAR,
	UNIQUE (foodName),
	FOREIGN KEY (foodName) REFERENCES R5(foodName)
ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT
INTO R6(nutritionalFactName, nutritionalFactTotalProteins, nutritionalFactTotalSugars, nutritionalFactTotalFats, nutritionalFactTotalCalories, foodName);
VALUES('Steak with asparagus and potatoes', 34, 32, 22, 630, 'Steak with asparagus and potatoes');

INSERT
INTO R6(nutritionalFactName, nutritionalFactTotalProteins, nutritionalFactTotalSugars, nutritionalFactTotalFats, nutritionalFactTotalCalories, foodName);
VALUES('Caesar salad and chicken breast', 30, 12, 18, 340, 'Caesar salad and chicken breast');

INSERT
INTO R6(nutritionalFactName, nutritionalFactTotalProteins, nutritionalFactTotalSugars, nutritionalFactTotalFats, nutritionalFactTotalCalories, foodName);
VALUES('Greek yogurt and oats', 21, 31, 5, 270, 'Greek yogurt and oats');

INSERT
INTO R6(nutritionalFactName, nutritionalFactTotalProteins, nutritionalFactTotalSugars, nutritionalFactTotalFats, nutritionalFactTotalCalories, foodName);
VALUES('Burger & fries', 32, 85, 56, 880, 'Burger & fries');

INSERT
INTO R6(nutritionalFactName, nutritionalFactTotalProteins, nutritionalFactTotalSugars, nutritionalFactTotalFats, nutritionalFactTotalCalories, foodName);
VALUES('French toast', 6, 25, 10, 140, 'French toast');

CREATE TABLE R7(
	recipeName	VARCHAR	PRIMARY KEY,
	instructions	VARCHAR,
	foodName	VARCHAR,
FOREIGN KEY (foodName) REFERENCES R5(foodName), 
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R7(recipeName, instructions, foodName)
VALUES('Steak with Asparagus and potatoes recipe', 'Grill steaks in a hot pan for 8 minutes then cover steak with tin foil to rest, cook the asparagus in the steak pan and bake potatoes in the oven at 425 F for 20 mins then cover with cheese to serve.', 'Steak with Asparagus and potatoes');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Caesar Salad with chicken breast Recipe', 'Wash and cut lettuce into bite size pieces; add croutons and ranch dressing and mix well. Optional topping of olives, bacon bits, cheese. Add a little bit of oil on the pan, roast garlic before adding butterflied chicken breast on the stove at medium heat. Add honey, soy sauce and a little bit of oregano and fry until cooked in the middle. Cut up into bite size pieces and add onto salad.', 'Caesar Salad with chicken breast');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Greek yogurt and oats Recipe', 'Slightly roast oats in the oven then in a bowl put in jam, greek yogurt, diced fruits of choice and oats when cooked to golden brown and rested to room temperature.', 'Greek yogurt and oats');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Burger & fries Recipe', 'Form a ball with ground beef before flattening, then put patty on pan at medium heat until brown. Turn off the stove and place a piece of american cheese and some onions on top of the patty. Put desired condiments & sliced vegetables on a bun and serve with fries. Wash and peel potatoes then cut them into strips. Dry with a towel then sprinkle some oil on top before putting in the air fryer,fry for 20 min then sprinkle salt to serve.', 'Burger & fries');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('French toast Recipe', 'Create an egg wash by adding two eggs, vanilla extract and cinnamon into a bowl. Heat up the pan and place a small slice of butter. Dip toast in egg wash and fry until golden brown. Add condensed milk as topping before serving.', 'French toast');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Kimchi fried rice Recipe', 'Heat up skillet, stir fry kimchi until fragrant. Add rice, kimchi juice, water, gouchujang, beef slices and stir fry over medium heat for 7 minutes. Garnish with green onion, seaweed and sesame seeds and serve right away.', 'Kimchi fried rice');


INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Tuna sandwich recipe', 'Toast two slices of preferred bread, pour can of tuna, mayonnaise, celery, onion, relish and roast garlic into a bowl and mix well. spread mix between toasted bread and serve', 'Tuna sandwich');


INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Fruit smoothie recipe', 'Add half scoop of protein powder, a banana, a cup of greek yogurt, ice and a preferred amount of strawberries, blueberries and blend well to serve.', 'French toast');

INSERT
INTO R7(recipeName, instructions, foodName);
VALUES('Pasta salad recipe', 'Cook pasta until al dante then run over cold water to prevent overcooking. chop up some tomatoes, bell peppers, onions, cucumbers. Mix all ingredients well and sprinkle a choice of cheese and some Italian dressing.', 'Pasta Salad');


CREATE TABLE R8(
	restaurantName	VARCHAR,	
	restaurantAddress 	VARCHAR,
restaurantRating 	FLOAT,
restaurantCuisine 	VARCHAR,
PRIMARY KEY (restaurantName, restaurantAddress, restaurantCuisine),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('Togo Sushi', '3380 Shrum Lane, Vancouver, BC', 3.7, 'Japanese');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('Mercante', '6488 University Blvd, Vancouver, BC', 4.0, 'Italian');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('My Home', '5728 University Blvd B9, Vancouver, BC', 4.1, 'Chinese');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('The Corner Kitchen', '115-5743 Dalhousie Rd, Vancouver, BC', 4.1, 'Korean');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('McDonalds', '5728 University Blvd #101, Vancouver, BC', 3.4, 'American');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('Chicko Chicken', '6023 West Blvd, Vancouver, BC V6M 3X2', 4.2, 'Korean');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('Bella Roma Pizzeria & Ristorante', '4460 W 10th Ave, Vancouver, BC V6R 2H9', 4.3, 'Italian');

INSERT
INTO R8(restaurantName,restaurantAddress, restaurantRating, restaurantCuisine)
VALUES('Smoke and Bones BBQ', '999 Marine Dr, North Vancouver, BC V7P 1S4', 4.4, 'American');


CREATE TABLE R9(
	ingredientName	VARCHAR	PRIMARY KEY,
	category		VARCHAR
);

INSERT
INTO R9(ingredientName, category)
VALUES('asparagus', 'vegetable');

INSERT
INTO R9(ingredientName, category)
VALUES('greek yogurt', 'dairy');

INSERT
INTO R9(ingredientName, category)
VALUES('steak', 'meat');

INSERT
INTO R9(ingredientName, category)
VALUES('potato', 'vegetable');

INSERT
INTO R9(ingredientName, category)
VALUES('lettuce', 'vegetable');

INSERT
INTO R9(ingredientName, category)
VALUES('kimchi', 'preserved vegetables');

INSERT
INTO R9(ingredientName, category)
VALUES('pickled radish', 'preserved vegetables');

INSERT
INTO R9(ingredientName, category)
VALUES('butter', 'dairy');

INSERT
INTO R9(ingredientName, category)
VALUES('milk', 'dairy');

INSERT
INTO R9(ingredientName, category)
VALUES('ground beef', 'meat');

INSERT
INTO R9(ingredientName, category)
VALUES('beef short rib', 'meat');

INSERT
INTO R9(ingredientName, category)
VALUES('New York strip', 'meat');

INSERT
INTO R9(ingredientName, category)
VALUES('tuna', 'fish');

INSERT
INTO R9(ingredientName, category)
VALUES('orange', 'fruit');

INSERT
INTO R9(ingredientName, category)
VALUES('penne', 'pasta');

INSERT
INTO R9(ingredientName, category)
VALUES('blueberry', 'fruit');

INSERT
INTO R9(ingredientName, category)
VALUES('strawberry', 'fruit');

INSERT
INTO R9(ingredientName, category)
VALUES('salt', 'condiment');

INSERT
INTO R9(ingredientName, category)
VALUES('Italian dressing', 'condiment');

INSERT
INTO R9(ingredientName, category)
VALUES('gochujang', 'condiment');

INSERT
INTO R9(ingredientName, category)
VALUES('onion', 'vegetables');

INSERT
INTO R9(ingredientName, category)
VALUES('cucumber', 'vegetables');

INSERT
INTO R9(ingredientName, category)
VALUES('egg', 'poultry');

INSERT
INTO R9(ingredientName, category)
VALUES('cheddar cheese', 'dairy');

INSERT
INTO R9(ingredientName, category)
VALUES('multi-grain bread', 'bread');

INSERT
INTO R9(ingredientName, category)
VALUES('white bread', 'bread');

INSERT
INTO R9(ingredientName, category)
VALUES('mayonnaise', 'condiment');

INSERT
INTO R9(ingredientName, category)
VALUES('relish', 'condiment');

INSERT
INTO R9(ingredientName, category)
VALUES('garlic', 'vegetables');

CREATE TABLE R10(
	ingredientName	VARCHAR,	
	recipeName	 	VARCHAR,
quantity		INT,
PRIMARY KEY (ingredientName, recipeName),
FOREIGN KEY (ingredientName) REFERENCES R9(ingredientName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (recipeName) REFERENCES R7(recipeName)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R10(ingredientName, recipeName, quantity) 
VALUES ('ground beef ', ' Burger & Fries', 100);

INSERT
INTO R10(ingredientName, recipeName, quantity) 
VALUES ('potato', ' Burger & Fries', 150);

INSERT
INTO R10(ingredientName, recipeName, quantity) 
VALUES ('bread ', ' French Toast', 100);

INSERT
INTO R10(ingredientName, recipeName, quantity) 
VALUES ('lettuce ', ' Caesar Salad', 200);

INSERT
INTO R10(ingredientName, recipeName, quantity) 
VALUES ('tomato', ' Burger & Fries', 50);


CREATE TABLE R11(
	groceryStoreName	VARCHAR,	
	groceryStoreAddress	VARCHAR,
	openHours		VARCHAR,
groceryStoreRating	FLOAT,
PRIMARY KEY(groceryStoreName, groceryStoreAddress)
);

INSERT
INTO R11(groceryStoreName, groceryStoreAddress, openHours, groceryStoreRating) 
VALUES ('Costco', '9151 Bridgeport Rd, Richmond, BC', '9:00-20:30', 4.1);

INSERT
INTO R11(groceryStoreName, groceryStoreAddress, openHours, groceryStoreRating) 
VALUES ('Costco', '605 Expo Blvd, Vancouver, BC', '9:00-20:30', 4.3);

INSERT
INTO R11(groceryStoreName, groceryStoreAddress, openHours, groceryStoreRating) 
VALUES ('Save On Foods', '5945 Berton Ave, Vancouver, BC', '7:00-22:00', 3.9);

INSERT
INTO R11(groceryStoreName, groceryStoreAddress, openHours, groceryStoreRating) 
VALUES ('Real Canadian Superstore', '3185 Grandview Hwy, Vancouver, BC', '7:00-23:00', 4.1);

INSERT
INTO R11(groceryStoreName, groceryStoreAddress, openHours, groceryStoreRating) 
VALUES ('Safeway', '2733 W Broadway, Vancouver, BC', '7:00-23:00', 4.1);

CREATE TABLE R12(
	groceryStoreName	VARCHAR,	
	groceryStoreAddress	VARCHAR,
	ingredientName	VARCHAR,
sellsCost		INT,
PRIMARY KEY(groceryStoreName, groceryStoreAddress, ingredientName),
FOREIGN KEY(groceryStoreName, groceryStoreAddress) REFERENCES R11(groceryStoreName, groceryStoreAddress), 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (ingredientName) REFERENCES R9(ingredientName),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Costco', '9151 Bridgeport Rd, Richmond, BC', 'asparagus', 'vegetable');

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Costco', '605 Expo Blvd, Vancouver, BC', 'greek yogurt', 'dairy');

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Save On Foods', '5945 Berton Ave, Vancouver, BC', 'steak', 'meat');

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Real Canadian Superstore', '3185 Grandview Hwy, Vancouver, BC', 'potato', 'vegetable');

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Safeway', '2733 W Broadway, Vancouver, BC', 'lettuce', 'vegetable');

INSERT
INTO R12(groceryStoreName, groceryStoreAddress, ingredientName, sellsCost)
VALUES('Costco', '9151 Bridgeport Rd, Richmond, BC', 'ranch', 'dressing');

CREATE TABLE R13(
	restaurantCuisine	VARCHAR	PRIMARY KEY,
	mealCuisine	 	VARCHAR,
FOREIGN KEY(restaurantCuisine) REFERENCES R8(restaurantCuisine),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R13(restaurantCuisine, mealCuisine) 
VALUES ('French', 'French');

INSERT
INTO R13(restaurantCuisine, mealCuisine) 
VALUES ('Italian', 'Italian');

INSERT
INTO R13(restaurantCuisine, mealCuisine) 
VALUES ('American', 'American');

INSERT
INTO R13(restaurantCuisine, mealCuisine) 
VALUES ('Chinese', 'Chinese');

INSERT
INTO R13(restaurantCuisine, mealCuisine) 
VALUES ('Korean', 'Korean');

CREATE TABLE R14(
	uid			INT,
nutritionalReqID	INT,
mealName		VARCHAR,
mealPlanName	VARCHAR,
restaurantAddress	VARCHAR,
restaurantName	VARCHAR,
foodName		VARCHAR,
FOREIGN KEY(uid) REFERENCES R2(uid),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(mealName) REFERENCES R4(mealName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(mealPlanName) REFERENCES R3(mealPlanName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(restaurantName, restaurantAddress) REFERENCES R8(restaurantName, restaurantAddress),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(foodName) REFERENCES R5(foodName),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R14(uid, nutritionalReqID, mealName, mealPlanName, restaurantAddress, restaurantName, foodName) 
VALUES (131, 156, 'burger and fries', 'regular daily', '5728 University Blvd #101, Vancouver, BC', 
'McDonalds', 'burger');

INSERT
INTO R14(uid, nutritionalReqID, mealName, mealPlanName, restaurantAddress, restaurantName, foodName) 
VALUES (168, 460, 'beef stir fry noodles ', 'regular daily', '5728 University Blvd B9, Vancouver, BC', 'My Home Cuisine', 'noodles');

INSERT
INTO R14(uid, nutritionalReqID, mealName, mealPlanName, restaurantAddress, restaurantName, foodName) 
VALUES (131, 156, 'burger and fries', 'regular daily', '5728 University Blvd #101, Vancouver, BC', 
'McDonalds', 'fries');

INSERT
INTO R14(uid, nutritionalReqID, mealName, mealPlanName, restaurantAddress, restaurantName, foodName) 
VALUES (189, 416, 'beef stir fry noodles ', 'regular daily', '5728 University Blvd B9, Vancouver, BC', 'My Home Cuisine', 'noodles');

INSERT
INTO R14(uid, nutritionalReqID, mealName, mealPlanName, restaurantAddress, restaurantName, foodName) 
VALUES (189, 416, 'burger and fries', 'regular daily', '5728 University Blvd #101, Vancouver, BC', 
'McDonalds', 'burger');

CREATE TABLE R15(
	uid			INT,
nutritionalReqID	INT,
mealName		VARCHAR,
mealPlanName	VARCHAR,
ingredientName	VARCHAR,
recipeName		VARCHAR,
groceryStoreName 	VARCHAR,
groceryStoreAddress	VARCHAR,
foodName		VARCHAR,
PRIMARY KEY (uid, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName),
FOREIGN KEY(uid) REFERENCES R2(uid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(mealName) REFERENCES R4(mealName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(mealPlanName) REFERENCES R3(mealPlanName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(ingredientName) REFERENCES R9(ingredientName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(recipeName) REFERENCES R7(recipeName),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(groceryStoreName, groceryStoreAddress) REFERENCES R11(groceryStoreName, groceryStoreAddress),
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(foodName) REFERENCES R5(foodName),
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT
INTO R15(uid, nutritionalReqID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName)
VALUES(131, 156, 'Steak with asparagus and potatoes', 'regular daily', 'asparagus', 'Steak with Asparagus and potatoes', 'Costco', '9151 Bridgeport Rd, Richmond, BC', 'Steak with Asparagus and potatoes');

INSERT
INTO R15(uid, nutritionalReqID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName)
VALUES(131, 156, 'Steak with asparagus and potatoes', 'bulking', 'asparagus', 'Steak with Asparagus and potatoes', 'Costco', '9151 Bridgeport Rd, Richmond, BC', 'Steak with Asparagus and potatoes');

INSERT
INTO R15(uid, nutritionalReqID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName)
VALUES(131, 156, 'Steak with asparagus and potatoes', 'low fat', 'asparagus', 'Steak with Asparagus and potatoes', 'Costco', '9151 Bridgeport Rd, Richmond, BC', 'Steak with Asparagus and potatoes');

INSERT
INTO R15(uid, nutritionalReqID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName)
VALUES(168, 460, 'Steak with asparagus and potatoes', 'regular daily', 'asparagus', 'Steak with Asparagus and potatoes', 'Costco', '9151 Bridgeport Rd, Richmond, BC', 'Steak with Asparagus and potatoes');

INSERT
INTO R15(uid, nutritionalReqID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName)
VALUES(189, 416, 'Steak with asparagus and potatoes', 'regular daily', 'asparagus', 'Steak with Asparagus and potatoes', 'Costco', '9151 Bridgeport Rd, Richmond, BC', 'Steak with Asparagus and potatoes');


-- APPENDIX B - Tuples

-- The following will list out the table rows that are planned for insertion. The section after will show the insertion SQL DDL.

-- Nutrition Requirement:
-- ID 156, total protein: 48g, total sugar: 250g, total fats: 40g, total calories: 1700
-- ID 460, total protein: 70g, total sugar: 300g, total fats: 55g, total calories: 2400
-- ID 416, total protein: 280g, total sugar: 483g, total fats: 65g, total calories: 3400
-- ID 233, total protein: 211g, total sugar: 367g, total fats: 46g, total calories: 2400
-- ID 521, total protein: 120g, total sugar: 280g, total fats: 44g, total calories: 2000
-- ID 201, total protein: 100g, total sugar: 275, total fats, 50g, total calories: 2400
-- ID 042, total protein: 90g, total sugar: 225, total fats, 49g, total calories: 1900
-- ID 055, total protein: 60g, total sugar: 210, total fats, 43g, total calories: 1800
-- User details:
-- Name: Jennifer, ID 131, Nutritional requirement ID: 156, Address: 335 Elbing street, budget: $150 Phone: 778-365-7145
-- Name: David, ID 168, Nutritional requirement ID: 460, Address: 1743 Grey Avenue, budget: $120 Phone: 778-563-9865
-- Name: Chadwick, ID 189, Nutritional requirement ID: 416, Address: 8987 Webber street, budget: $400 Phone: 778-451-2333
-- Name: Mathew, ID 457, Nutritional requirement ID: 233, Address: 133 14th street, budget: $200 Phone: 236-446-3535
-- Name: Victoria, ID 381, Nutritional requirement ID: 521, Address: 8763 Cross drive, budget: $600 Phone: 778-867-9025
-- Name: Ethan, ID 201, Nutritional requirement ID: 406, Address: 5418 Cross drive, budget: $260 Phone: 604-379-6581
-- Name: Peggy, ID 042, Nutritional requirement ID: 510, Address: 687 14th Avenue East, budget: $350 Phone: 778-981-3630
-- Name: Cindy, ID 055, Nutritional requirement ID: 220, Address: 8763 Sexsmith drive, budget: $300 Phone: 236-856-7975
-- Meal plan:

-- User ID: 131, meal plan name: regular daily, starting date: 2023-06-07, duration: 49 days
-- User ID: 168, meal plan name: regular daily, starting date: 2023-03-15, duration: 42 days
-- User ID: 189, meal plan name: bulking, starting date: 2023-11-11, duration: 30 days
-- User ID: 457, meal plan name: low fat starting date: 2024-01-12, duration: 27 days
-- User ID: 381, meal plan name: regular daily, starting date: 2023-08-15, duration: 30 days
-- User ID: 201, meal plan name: regular daily, starting date: 2023-03-10, duration: 30 days
-- User ID: 042, meal plan name: protein focused, starting date: 2023-05-14, duration: 21 days
-- User ID: 055, meal plan name: international daily, starting date: 2023-12-23, duration: 14 days



-- Meal:
-- Meal name: Steak with asparagus and baked potatoes, dining time: 40 min, Cuisine type: Italian
-- Meal name: Caesar salad with chicken breast, dining time: 25 min, Cuisine type: American
-- Meal name: Greek yogurt and oats, dining time: 10 min, Cuisine type: American
-- Meal name: Beef stir fry noodles, dining time: 30 min, Cuisine type: Chinese
-- Meal name: Kimchi fried rice with pickled radish, dining time: 20 min, Cuisine type: Korean
-- Meal name: Burger and fries, dining time: 25 min, Cuisine type: American
-- Meal name: French toast, dining time: 15 min, Cuisine type: French
-- Meal name: Bibimbap and kimchi, dining time: 25 min, Cuisine type: Korean
-- Meal name: Lasagna and garlic bread, dining time: 25 min, Cuisine type: Italian
-- Meal name: Carbonara and lemonade, dining time: 25 min, Cuisine type: Italian
-- Meal name: French onion soup and baguette, dining time: 25 min, Cuisine type: French
-- Meal name: Crispy char siu and soy sauce chicken over rice, dining time: 30 min, Cuisine type: Chinese
-- Meal name: baby back ribs with fries, dining time: 30 min, Cuisine type: American
-- Meal name: Peking duck with steamed pancake and stir fried vegetables, dining time: 30 min, Cuisine type: Chinese
-- Meal name: Fruit smoothie and oats, dining time: 5 min, Cuisine type: American
-- Meal name: Tuna sandwich and fresh squeezed fruit juice, dining time: 15 min, Cuisine type: American
-- Meal name: Pasta salad and lemonade, dining time: 15 min, Cuisine type: Italian
-- Meal name: Korean fried chicken and beer, dining time: 25 min, Cuisine type: Korean

-- Food nutrition fact:
-- Name: Steak, cost: $20, calories: 300, sugar: 0 g, protein: 30 g, fat: 15 g
-- Name: asparagus, cost: $3, calories: 30, sugar: 2 g, protein: 1 g, fat: 0 g
-- Name: baked potatoes, cost: $4, calories: 210, sugar: 30 g, protein: 3 g, fat: 7 g
-- Name: Caesar salad, cost: $6, calories: 200, sugar: 12 g, protein: 5 g, fat: 15 g
-- Name: Roast chicken breast, cost: $8, calories: 140, sugar: 0 g, protein:  25g, fat: 3 g
-- Name: Greek yogurt, cost: $4, calories: 120, sugar: 6 g, protein: 17 g, fat: 1 g
-- Name: Roasted oats, cost: $2, calories: 150, sugar: 25g, protein: 4 g, fat: 4 g
-- Name: Beef noodle stir fry, cost: $10, calories: 400, sugar 30 g, protein: 20 g, fat: 15 g
-- Name: Kimchi fried rice, cost: $12, calories: 350, sugar: 44 g, protein: 10 g, fat: 12 g
-- Name: Pickled radish, cost: $2, calories 10, sugar: 2 g, protein: 1 g, fat: 0 g
-- Name: Burger, cost: $6, calories: 500, sugar: 45 g, protein: 28 g, fat: 35 g
-- Name: French fries, cost: $4, calories: 380, sugar: 50 g, protein: 4 g, fat: 21 g
-- Name: French toast, cost: $4, calories: 140, sugar: 25 g, protein: 6 g, fat: 10 g
-- Name: Bibimbap, cost: $12, calories: 600, sugar: 100 g, protein: 30 g, fat: 26 g
-- Name: Kimchi, cost: $1, calories: 10, sugar: 4 g, protein: 1 g, fat: 1 g
-- Name: Lasagna, cost: $15, calories: 410, sugar: 40 g, protein: 22 g, fat: 20 g
-- Name: Garlic bread, cost: $3, calories: 120, sugar: 18 g, protein: 3 g, fat: 6 g
-- Name: Carbonara, cost: 12, calories: 520, sugar: 55g, protein: 20g, fat: 28 g
-- Name: Lemonade, cost: $2, calories: 120, sugar: 30 g, protein: 0 g, fat: 0 g
-- Name: French onion soup, cost: $12 calories: 260, sugar: 35g, protein: 15g, fat: 13 g
-- Name: Baguette, cost: $2, calories: 180, sugar: 40, protein: 6 g, fat: 2 g
-- Name: crispy char siu, cost: $12, calories: 300, sugar: 9 g, protein:25 g, fat: 21 g
-- Name: soy sauce chicken, cost: $12, calories: 190, sugar: 12 g, protein: 22 g, fat:11 g
-- Name: steamed rice, cost: $2, calories: 200, sugar: 45 g, protein: 0 g, fat: 1 g
-- Name: baby back ribs, cost: $29, calories: 350, sugar: 10 g, protein: 27 g, fat: 19 g
-- Name: Peking duck, cost: $40, calories: 280, sugar: 5 g, protein: 24g, fat: 21 g
-- Name: steamed pancake, cost: $3, calories: 110, sugar: 22 g, protein: 3 g, fat: 1 g
-- Name: vegetable stir fry, cost: $10, calories: 80, sugar: 4 g, protein: 4 g, fat: 3 g
-- Name: fruit smoothie, cost: $5, calories: 140, sugar: 25 g, protein: 3 g, fat: 1 g
-- Name: tuna sandwich, cost: $8, calories: 350, sugar: 40 g, protein: 20 g, fat: 13 g
-- Name: fresh squeezed orange juice, cost: $6, calories: 110, sugar: 23 g, protein: 2 g, fat: 0 g
-- Name: pasta salad, cost: $6, calories: 230, sugar: 43 g, protein: 7 g, fat: 10 g
-- Name: Korean fried chicken, cost: $19, calories: 400, sugar: 6 g, protein: 25 g, fat: 25 g
-- Name: Beer, cost: $4, calories: 120, sugar: 14 g, protein: 1 g, fat: 1 g


-- Restaurant:
-- restaurant address: (3380 Shrum Lane, Vancouver, BC), restaurant name:Togo Sushi, restaurant rating: 3.7, restaurant cuisine: Japanese
-- restaurant address: (6488 University Blvd, Vancouver, BC), restaurant name:Mercante, restaurant rating: 4.0, restaurant cuisine: Italian
-- restaurant address: ( 5728 University Blvd B9, Vancouver, BC), restaurant name:My Home Cuisine, restaurant rating: 3.7, restaurant cuisine: Chinese
-- restaurant address: (115-5743 Dalhousie Rd, Vancouver, BC), restaurant name:The Corner Kitchen, restaurant rating: 4.1, restaurant cuisine: Korean
-- restaurant address: (5728 University Blvd #101, Vancouver, BC), restaurant name:McDonalds, restaurant rating: 3.4, restaurant cuisine: American
-- restaurant address: (6023 West Blvd, Vancouver, BC V6M 3X2), restaurant name:Chicko Chicken, restaurant rating: 4.2, restaurant cuisine: Korean
-- restaurant address: (4460 W 10th Ave, Vancouver, BC V6R 2H9), restaurant name:Bella Roma Pizzeria & Ristorante, restaurant rating: 4.3, restaurant cuisine: Italian
-- restaurant address: (999 Marine Dr, North Vancouver, BC V7P 1S4), restaurant name:Smoke and Bones BBQ, restaurant rating: 4.4, restaurant cuisine: American

-- Grocery store:
-- Grocery store name: Costco, Grocery store address: (9151 Bridgeport Rd, Richmond, BC), open hours: 9:00-20:30, store rating: 4.1
-- Grocery store name: Costco, Grocery store address: (605 Expo Blvd, Vancouver, BC), open hours: 9:00-20:30, store rating: 4.3
-- Grocery store name: Save On Foods, Grocery store address: (5945 Berton Ave, Vancouver, BC), open hours: 7:00-22:00, store rating: 3.9
-- Grocery store name: Real Canadian Superstore, Grocery store address: (3185 Grandview Hwy, Vancouver, BC), open hours: 7:00-23:00, store rating: 4.1
-- Grocery store name: Safeway, Grocery store address: (2733 W Broadway, Vancouver, BC), open hours: 7:00-23:00, store rating: 4.1

-- Ingredient:
-- -	name: asparagus, type: vegetable
-- -	name: greek yogurt, type: dairy
-- -	name: steak, type: meat
-- -	name: potato, type: vegetable
-- -	name: lettuce, type: vegetable
-- -	name: kimchi, type: preserved vegetables
-- -	name: pickled radish, type: preserved vegetables
-- -	name: butter, type: dairy
-- -	name: milk, type: dairy
-- -	name: ground beef, type: meat
-- -	name: beef short rib, type: meat
-- -	name: New York Strip, type: meat
-- -	name: tuna, type: fish
-- -	name: orange, type: fruit
-- -	name: penne, type: pasta
-- -	name: blueberry, type: fruit
-- -	name: strawberry, type: fruit
-- -	name: salt, type: condiment
-- -	name: Italian dressing, type: condiment
-- -	name: gochujang, type: condiment
-- -	name: onion, type: vegetables
-- -	name: cucumber, type: vegetables
-- -	name: egg, type: poultry
-- -	name: cheese, type: dairy
-- -	name: multi-grain bread, type: bread
-- -	name: white bread, type: bread
-- -	name: mayonnaise, type: condiment
-- -	name: relish, type: condiment
-- -	name: garlic, type: vegetable

-- Recipe:

-- Steak with Asparagus and potatoes: 
-- Grill steaks in a hot pan for 8 minutes then cover steak with tin foil to rest, cook the asparagus in the steak pan and bake potatoes in the oven at 425 F for 20 mins then cover with cheese to serve.

-- Caesar Salad Recipe with chicken breast:
-- Wash and cut lettuce into bite size pieces; add croutons and ranch dressing and mix well. Optional topping of olives, bacon bits, cheese. Add a little bit of oil on the pan, roast garlic before adding butterflied chicken breast on the stove at medium heat. Add honey, soy sauce and a little bit of oregano and fry until cooked in the middle. Cut up into bite size pieces and add onto salad.

-- Greek yogurt and oats Recipe:
-- Slightly roast oats in the oven then in a bowl put in jam, greek yogurt, diced fruits of choice and oats when cooked to golden brown and rested to room temperature.

-- Burger & fries Recipe:
-- Form a ball with ground beef before flattening, then put patty on pan at medium heat until brown. Turn off the stove and place a piece of american cheese and some onions on top of the patty. Put desired condiments & sliced vegetables on a bun and serve with fries. 
-- Wash and peel potatoes then cut them into strips. Dry with a towel then sprinkle some oil on top before putting in the air fryer,fry for 20 min then sprinkle salt to serve.

-- French toast Recipe:
-- Create an egg wash by adding two eggs, vanilla extract and cinnamon into a bowl. Heat up the pan and place a small slice of butter. Dip choice of bread in egg wash and fry until golden brown. Add condensed milk as topping before serving.

-- Tuna sandwich Recipe:
-- Toast two slices of preferred bread, pour can of tuna, mayonnaise, celery, onion, relish and roast garlic into a bowl and mix well. spread mix between toasted bread and serve

-- Fruit smoothie Recipe:
-- Add half scoop of protein powder, a banana, a cup of greek yogurt, ice and a preferred amount of strawberries, blueberries and blend well to serve.

-- Pasta salad Recipe: 
-- Cook pasta until al dante then run over cold water to prevent overcooking. chop up some tomatoes, bell peppers, onions, cucumbers. Mix all ingredients well and sprinkle a choice of cheese and some Italian dressing. 

-- Kimchi fried rice Recipe: Heat up skillet, stir fry kimchi until fragrant. Add rice, kimchi juice, water, gouchujang, beef slices and stir fry over medium heat for 7 minutes. Garnish with green onion, seaweed and sesame seeds and serve right away.
