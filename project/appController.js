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

router.get("/demotable", async (req, res) => {
  // Implementation of the backend
  const tableContent = await appService.fetchR14FromDb();
  // Returning result to front end.
  res.json({ data: tableContent });
});

router.get("/initiate-demotable", async (req, res) => {
  // Implementation of the backend
  const tableContent = await appService.fetchR14FromDb();
  // Returning result to front end.
  res.json({ data: tableContent });
});

// router.post("/initiate-demotable", async (req, res) => {
//     const initiateResult = await appService.fetchR14FromDb(); // TODO changed
//     if (initiateResult) {
//         res.json({ success: true });
//     } else {
//         res.status(500).json({ success: false });
//     }
// });

// router.post("/insert-demotable", async (req, res) => {
//     const { id, name, text1, text2 } = req.body;
//     const insertResult = await appService.insertDemotable(id, name, text1, text2);
//     if (insertResult) {
//         res.json({ success: true });
//     } else {
//         res.status(500).json({ success: false });
//     }
// });

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
  // const insertResultR12 = await appService.insertR12(req.body);
  // const insertResultR10 = await appService.insertR10(req.body);
  if (insertResultR15) {
    res.json({ success: true });
  } else {
    res.status(500).json({ success: false });
  }
});

router.post("/update-name-demotable", async (req, res) => {
  const { oldName, newName } = req.body;
  const updateResult = await appService.updateNameDemotable(oldName, newName);
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
