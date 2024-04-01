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

async function fetchR14FromDb() {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute("SELECT * FROM R14");
    return result.rows;
  }).catch(() => {
    return [];
  });
}

async function fetchR15FromDb() {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute("SELECT * FROM R15");
    return result.rows;
  }).catch(() => {
    return [];
  });
}

// async function initiateDemotable() {
//     return await withOracleDB(async (connection) => {
//         try {
//             await connection.execute(`DROP TABLE DEMOTABLE`);
//         } catch(err) {
//             console.log('Table might not exist, proceeding to create...');
//         }

//         const result = await connection.execute(`
//             CREATE TABLE DEMOTABLE (
//                 id NUMBER PRIMARY KEY,
//                 name VARCHAR2(20),
//                 text1 VARCHAR2(20),
//                 text2 VARCHAR2(20)
//             )
//         `);
//         return true;
//     }).catch(() => {
//         return false;
//     });
// }

// async function insertDemotable(id, name, text1, text2) {
//     return await withOracleDB(async (connection) => {
//         const result = await connection.execute(
//             `INSERT INTO DEMOTABLE (id, name, text1, text2) VALUES (:id, :name, :text1, :text2)`,
//             [id, name, text1, text2],
//             { autoCommit: true }
//         );

//         return result.rowsAffected && result.rowsAffected > 0;
//     }).catch(() => {
//         return false;
//     });
// }

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
  console.log(body);
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
  console.log(body);
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
  console.log(body);
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

async function updateNameDemotable(oldName, newName) {
  return await withOracleDB(async (connection) => {
    const result = await connection.execute(
      `UPDATE DEMOTABLE SET name=:newName where name=:oldName`,
      [newName, oldName],
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

module.exports = {
  testOracleConnection,
  fetchR14FromDb,
  fetchR15FromDb,
  insertR15,
  insertR14,
  insertR12,
  insertR10,
  updateNameDemotable,
  countDemotable,
};
