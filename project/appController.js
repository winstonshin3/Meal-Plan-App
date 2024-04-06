const express = require("express");
const appService = require("./appService");
const router = express.Router();

// ----------------------------------------------------------
// API endpoints
// Modify or extend these routes based on your project's needs.
router.get("/check-db-connection", async (req, res) => {
  const isConnect = await appService.testOracleConnection();
  if (isConnect) {
    res.send("connected");
  } else {
    res.send("unable to connect");
  }
});



router.post("/getMaxCaloriesInRestaurantMealPlan", async (req, res) => {
  const userId = req.body.userId;
  const response = await appService.getGroupMaxTotalCaloriesQuery(userId);
  if (response) {
    res.json({
      success: true,
      data: response
    });
  } else {
    res.status(500).json({
      success: false,
      message: "Failed to get result."
    });
  }
});

router.post("/division", async (req, res) => {
  const userId = req.body.userId;
  const response = await appService.divisionQuery(userId);
  if (response) {
    res.json({
      success: true,
      data: response
    });
  } else {
    res.status(500).json({
      success: false,
      message: "Failed to get result."
    });
  }
});

router.get('/joinedQuery', async (req, res) => {
  // Implementation of the backend
  const tableContent = await appService.fetchJoinedTableFromDb();
  
  const headers = ["User ID", "Name", "Address", "Budget", "Phone", "Nutrition Requirement ID",
    "Required total Sugars", "Required total Fats", "Required total Proteins", "Required total Calories"]
  // Returning result to front end.
  res.json({ data: tableContent, headers: headers });
});

router.post("/aggregate-having", async (req, res) => {
  const { amount } = req.body;
  const updateResult = await appService.AggregateHaving(amount);
  if (updateResult) {
    res.status(200).json({ data: updateResult });
  } else {
    res.status(500).json({ success: false });
  }
});

router.get("/aggregate-groupby", async (req, res) => {
  const maxTime = await appService.aggregateGroupBy();

  res.json({ data: maxTime });
})



router.post("/projectTable", async (req, res) => {
  const tableContent = await appService.projectTableFromDb(req.body);
  if (!(tableContent.length === 0)) {
    res.json({ data: tableContent, success: true });
  } else {
    res.json({ data: tableContent, success: false });
  }
});

router.post("/selectTable", async (req, res) => {
  const tableContent = await appService.selectTableFromDb(req.body);
  const headers = [
    "User ID",
    "User Name",
    "User Address",
    "Budget",
    "Phone Number",
    "Diet Plan",
  ];
  if (!(tableContent.length === 0)) {
    res.json({ data: tableContent, headers: headers, success: true });
  } else {
    res.json({ data: tableContent, headers: headers, success: false });
  }
});

router.post("/insert-homeMadeFoodName", async (req, res) => {
  const insertResultR15 = await appService.insertR15(req.body);
  const insertResultR12 = await appService.insertR12(req.body);
  const insertResultR10 = await appService.insertR10(req.body);
  if (insertResultR15 && insertResultR12 && insertResultR10) {
    res.json({ success: true });
  } else if (!insertResultR15) {
    res.status(500).json({ success: false });
  } else if (!insertResultR12) {
    res.status(400).json({ success: false });
  } else if (!insertResultR10) {
    res.status(300).json({ success: false });
  }
});

router.post("/insert-restaurantFoodName", async (req, res) => {
  const insertResultR15 = await appService.insertR14(req.body);
  if (insertResultR15) {
    res.json({ success: true });
  } else {
    res.status(500).json({ success: false });
  }
});

router.post("/delete-mealPlan", async (req, res) => {
  const insertResultR15 = await appService.deleteR3(req.body);
  if (insertResultR15) {
    res.json({ success: true });
  } else {
    res.status(500).json({ success: false });
  }
});

router.post("/update-r2", async (req, res) => {
  const updateResult = await appService.updateR2(req.body);
  if (updateResult) {
    res.json({ success: true });
  } else {
    res.status(500).json({ success: false });
  }
});

router.get("/count-demotable", async (req, res) => {
  const tableCount = await appService.countDemotable();
  if (tableCount >= 0) {
    res.json({
      success: true,
      count: tableCount,
    });
  } else {
    res.status(500).json({
      success: false,
      count: tableCount,
    });
  }
});



router.get("/resultsTableR15", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R15");
  const headers = [
    "User ID",
    "Meal Name",
    "Meal Plan Name",
    "Ingredient",
    "Recipe",
    "Grocery Store Name",
    "Grocery Store Address",
    "Food Name",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR14", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R14");
  const headers = [
    "User ID",
    "Meal Name",
    "Meal Plan Name",
    "Restaurant Address",
    "Restaurant Name",
    "Food Name",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR12", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R12");
  const headers = [
    "Grocery Store Name",
    "Grocery Store Address",
    "Ingredient",
    "Price",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR11", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R11");
  const headers = [
    "Grocery Store Name",
    "Grocery Store Address",
    "Open Hours",
    "Grocery Store Rating",
  ];
  res.json({ data: tableContent, headers: headers });
});






router.get("/resultsTableR10", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R10");
  const headers = ["Ingredient", "Recipe", "Quantity"];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR9", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R9");
  const headers = [
    "Ingredient Name",
    "Category",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR8", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R8");
  const headers = [
    "Restaurant Name",
    "Restaurant Address",
    "Restaurant Rating",
    "Restaurant Cuisine",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR7", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R7");
  const headers = [
    "Recipe Name",
    "Instructions",
    "Food Name",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR5", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R5");
  const headers = [
    "Food Name",
    "Food Cost",
    "Nutritional Fact Name",
    "Discount",
    "Time Required",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR6", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R6");
  const headers = [
    "Nutritional Fact Name",
    "Total Sugars (g)",
    "Total Fats (g)",
    "Total Proteins (g)",
    "Total Calories",
    "Food Name"
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR4", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R4");
  const headers = [
    "Meal Name",
    "Dining Time",
    "Meal Cuisine",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR3", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R3");
  const headers = [
    "User ID",
    "Meal plan name",
    "Duration",
    "Date Created",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR2", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R2");
  const headers = [
    "User ID",
    "User Name",
    "User Address",
    "Budget",
    "Phone Number",
    "Diet Plan",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR1", async (req, res) => {
  const tableContent = await appService.fetchTableFromDb("R1");
  const headers = [
    "Nutritional Req ID",
    "Total Sugars (g)",
    "Total Fats (g)",
    "Total Proteins (g)",
    "Total Calories",
  ];
  res.json({ data: tableContent, headers: headers });
});

module.exports = router;
