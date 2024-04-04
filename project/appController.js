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

router.get("/resultsTableR14", async (req, res) => {
  const tableContent = await appService.fetchR14FromDb();
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

router.get("/resultsTableR15", async (req, res) => {
  const tableContent = await appService.fetchR15FromDb();
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

router.get("/resultsTableR12", async (req, res) => {
  const tableContent = await appService.fetchR12FromDb();
  const headers = [
    "Grocery Store Name",
    "Grocery Store Address",
    "Ingredient",
    "Price",
  ];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR10", async (req, res) => {
  const tableContent = await appService.fetchR10FromDb();
  const headers = ["Ingredient", "Recipe", "Quantity"];
  res.json({ data: tableContent, headers: headers });
});

router.get("/resultsTableR3", async (req, res) => {
  const tableContent = await appService.fetchR3FromDb();
  const headers = ["User ID", "Meal plan name", "Duration", "Date Created"];
  res.json({ data: tableContent, headers: headers });
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
            success: false ,
            message: "Failed to get result."
        });
    }
});

router.get('/joinedQuery', async (req, res) => {
    // Implementation of the backend
    const tableContent = await appService.fetchJoinedTableFromDb();
    //console.log(tableContent);
    const headers = ["User ID", "Name", "Address", "Budget", "Phone", "Nutrition Requirement ID", 
    "Required total Sugars", "Required total Fats", "Required total Proteins", "Required total Calories"]
    // Returning result to front end.
    res.json({ data: tableContent, headers: headers});
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

router.post("/aggregate-groupby", (req, res) => {
    const body = req.body;
    appService.aggregateGroupBy(body).then((result) => {
        res.status(200).json({ data: result });
    }).catch((err) => {
        res.status(500).json({ error: err.toString() });
    });
})

router.get("/resultsTableR2", async (req, res) => {
  const tableContent = await appService.fetchR2FromDb();
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

router.post("/projectTable", async (req, res) => {
  const tableContent = await appService.projectTableFromDb(req.body);
  if (!(tableContent.length === 0)) {
    res.json({ data: tableContent, success: true });
  } else {
    res.json({ data: tableContent, success: false });
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

module.exports = router;
