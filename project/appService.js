const oracledb = require("oracledb");
const loadEnvFile = require("./utils/envUtil");

const envVariables = loadEnvFile("./.env");

// Database configuration setup. Ensure your .env file has the required database credentials.
const dbConfig = {
  user: envVariables.ORACLE_USER,
  password: envVariables.ORACLE_PASS,
  connectString: `${envVariables.ORACLE_HOST}:${envVariables.ORACLE_PORT}/${envVariables.ORACLE_DBNAME}`,
  poolMin: 1,
  poolMax: 3,
  poolIncrement: 1,
  poolTimeout: 60,
};

// initialize connection pool
async function initializeConnectionPool() {
  try {
    await oracledb.createPool(dbConfig);
    console.log("Connection pool started");
  } catch (err) {
    console.error("Initialization error: " + err.message);
  }
}

async function closePoolAndExit() {
  console.log("\nTerminating");
  try {
    await oracledb.getPool().close(10); // 10 seconds grace period for connections to finish
    console.log("Pool closed");
    process.exit(0);
  } catch (err) {
    console.error(err.message);
    process.exit(1);
  }
}

initializeConnectionPool();

process.once("SIGTERM", closePoolAndExit).once("SIGINT", closePoolAndExit);

// ----------------------------------------------------------
// Wrapper to manage OracleDB actions, simplifying connection handling.
async function withOracleDB(action) {
  let connection;
  try {
    connection = await oracledb.getConnection(); // Gets a connection from the default pool
    return await action(connection);
  } catch (err) {
    console.error(err);
    throw err;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error(err);
      }
    }
  }
}

// ----------------------------------------------------------
// Core functions for database operations
// Modify these functions, especially the SQL queries, based on your project's requirements and design.
async function testOracleConnection() {
  return await withOracleDB(async (connection) => {
    return true;
  }).catch(() => {
    return false;
  });
}

async function fetchTableFromDb(tableName) {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(`SELECT * FROM ${tableName}`);
    return result.rows;
  }).catch(() => {
    return [];
  });
}


async function projectTableFromDb(body) {
  const { tableName, columnName } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `SELECT ${columnName} FROM ${tableName}`
    );
    return result.rows;
  }).catch(() => {
    return [];
  });
}

async function selectTableFromDb(body) {
  const { conditional } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `SELECT * FROM R2 WHERE ${conditional}`
    );
    return result.rows;
  }).catch(() => {
    return [];
  });
}

async function insertR15(body) {
  const {
    userID,
    mealName,
    mealPlanName,
    foodName,
    recipeName,
    ingredientName,
    groceryStoreName,
    groceryStoreAddress,
  } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `INSERT INTO R15 (userID, mealName, mealPlanName, ingredientName, recipeName, groceryStoreName, groceryStoreAddress, foodName) VALUES 
                       (:userID, :mealName, :mealPlanName, :ingredientName, :recipeName, :groceryStoreName, :groceryStoreAddress, :foodName)`,
      {
        userID,
        mealName,
        mealPlanName,
        ingredientName,
        recipeName,
        groceryStoreName,
        groceryStoreAddress,
        foodName,
      },
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function insertR14(body) {
  const {
    userID,
    mealName,
    mealPlanName,
    foodName,
    restaurantName,
    restaurantAddress,
  } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `INSERT INTO R14 (userID, mealName, mealPlanName, foodName, restaurantName, restaurantAddress) 
             VALUES (:userID, :mealName, :mealPlanName, :foodName, :restaurantName, :restaurantAddress)`,
      {
        userID,
        mealName,
        mealPlanName,
        foodName,
        restaurantName,
        restaurantAddress,
      },
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function insertR12(body) {
  const { groceryStoreName, groceryStoreAddress, ingredientName, price } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `INSERT INTO R12 (groceryStoreName, groceryStoreAddress, ingredientName, price) 
        VALUES (:groceryStoreName, :groceryStoreAddress, :ingredientName, :price)`,
      {
        groceryStoreName,
        groceryStoreAddress,
        ingredientName,
        price,
      },
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function insertR10(body) {
  const { ingredientName, recipeName, quantity } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `INSERT INTO R10 (ingredientName, recipeName, quantity) 
        VALUES (:ingredientName, :recipeName, :quantity)`,
      {
        ingredientName,
        recipeName,
        quantity,
      },
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function deleteR3(body) {
  const { userID, mealPlanName } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `DELETE FROM R3
        WHERE userID = :userID and mealPlanName = :mealPlanName`,
      {
        userID,
        mealPlanName,
      },
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function updateR2(body) {
  const { columnName, oldValue, newValue } = body;
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `UPDATE R2 SET ${columnName} = :newValue WHERE ${columnName} = :oldValue`,
      { oldValue, newValue }, // Bind variables
      { autoCommit: true }
    );
    return result.rowsAffected && result.rowsAffected > 0;
  }).catch(() => {
    return false;
  });
}

async function countDemotable() {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute("SELECT Count(*) FROM DEMOTABLE");
    return result.rows[0][0];
  }).catch(() => {
    return -1;
  });
}

//find the max calories within each meal plan at restaurants
async function getGroupMaxTotalCaloriesQuery(userId) {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      'SELECT mealPlanName AS "Meal Plan Name", MAX(totalCalories) AS "Max Meal Calories" FROM (SELECT mealPlanName, mealName, SUM(nutritionalFactTotalCalories) as totalCalories FROM R14 INNER JOIN R6 ON R14.foodName = R6.foodName WHERE R14.userId = :userId GROUP BY mealPlanName, mealName) GROUP BY mealPlanName',
      [userId],
      { autoCommit: true }
    );
    return result;
  }).catch(() => {
    return [];
  });
}

//find the stores with all the specified ingredients in a meal plan
//find ingredients sold by all stores
async function divisionQuery(userId) {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      'SELECT DISTINCT R12_1.groceryStoreName AS "Grocery Store Name", R12_1.groceryStoreAddress AS "Grocery Store Address" FROM R12 R12_1 WHERE R12_1.ingredientName NOT IN (SELECT DISTINCT R12_2.ingredientName FROM R12 R12_2 WHERE R12_2.ingredientName NOT IN (SELECT R15.ingredientName FROM R15 WHERE R15.userid = :userId))',
      [userId],
      { autoCommit: true }
    );
    
    return result;
  }).catch(() => {
    return [];
  });
}

async function fetchJoinedTableFromDb() {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute('SELECT * FROM R2 JOIN R1 USING (nutritionalReqID)');
    
    return result.rows;
  }).catch(() => {
    return [];
  });
}

async function AggregateHaving(amount) {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      'SELECT groceryStoreName, groceryStoreAddress FROM R12 GROUP BY groceryStoreName, groceryStoreAddress HAVING SUM(price) > :amount',
      [amount],
      { autoCommit: true }
    );
    
    return result.rows;
  }).catch(() => {
    return [];
  });
}

async function aggregateGroupBy() {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      'SELECT MAX(avg_diningTime) FROM (SELECT mealCuisine, AVG(diningTime) AS avg_diningTime FROM R4 GROUP BY mealCuisine)'
    );
    
    return result.rows;
  }).catch(() => {
    return [];
  });
}

module.exports = {
  testOracleConnection,
  fetchTableFromDb,
  projectTableFromDb,
  insertR15,
  insertR14,
  insertR12,
  insertR10,
  deleteR3,
  updateR2,
  selectTableFromDb,
  countDemotable,
  getGroupMaxTotalCaloriesQuery,
  divisionQuery,
  fetchJoinedTableFromDb,
  AggregateHaving,
  aggregateGroupBy
};
