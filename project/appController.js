const express = require('express');
const appService = require('./appService');

const router = express.Router();

// ----------------------------------------------------------
// API endpoints
// Modify or extend these routes based on your project's needs.
router.get('/check-db-connection', async (req, res) => {
    const isConnect = await appService.testOracleConnection();
    if (isConnect) {
        res.send('connected');
    } else {
        res.send('unable to connect');
    }
});

router.get('/demotable', async (req, res) => {
    // Implementation of the backend
    const tableContent = await appService.fetchDemotableFromDb();
    // Returning result to front end.
    res.json({data: tableContent});
});

router.post("/initiate-demotable", async (req, res) => {
    const initiateResult = await appService.initiateDemotable();
    if (initiateResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/insert-demotable", async (req, res) => {
    const { id, name, text1, text2 } = req.body;
    const insertResult = await appService.insertDemotable(id, name, text1, text2);
    if (insertResult) {
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

router.get('/count-demotable', async (req, res) => {
    const tableCount = await appService.countDemotable();
    if (tableCount >= 0) {
        res.json({ 
            success: true,  
            count: tableCount
        });
    } else {
        res.status(500).json({ 
            success: false, 
            count: tableCount
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


module.exports = router;