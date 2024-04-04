/*
 * These functions below are for various webpage functionalities.
 * Each function serves to process data on the frontend:
 *      - Before sending requests to the backend.
 *      - After receiving responses from the backend.
 *
 * To tailor them to your specific needs,
 * adjust or expand these functions to match both your
 *   backend endpoints
 * and
 *   HTML structure.
 *
 */

// This function checks the database connection and updates its status on the frontend.
async function checkDbConnection() {
  const statusElem = document.getElementById("dbStatus");
  const loadingGifElem = document.getElementById("loadingGif");

  const response = await fetch("/check-db-connection", {
    method: "GET",
  });

  // Hide the loading GIF once the response is received.
  loadingGifElem.style.display = "none";
  // Display the statusElem's text in the placeholder.
  statusElem.style.display = "inline";

  response
    .text()
    .then((text) => {
      statusElem.textContent = text;
    })
    .catch((error) => {
      statusElem.textContent = "connection timed out"; // Adjust error handling if required.
    });
}

async function displayTable(displayTable, fetchTable) {
  const tableElement = document.getElementById(displayTable);
  const tableBody = tableElement.querySelector("tbody");
  const thead = tableElement.querySelector("thead");
  const response = await fetch(fetchTable, {
    method: "GET",
  });
  const responseData = await response.json();
  const demotableContent = responseData.data;
  const demotableHeaders = responseData.headers;

  // Always clear old, already fetched data before new fetching process.
  if (thead) {
    thead.innerHTML = "";
  }
  const headerRow = thead.insertRow();
  demotableHeaders.forEach((header) => {
    const th = document.createElement("th");
    th.textContent = header;
    headerRow.appendChild(th);
  });

  if (tableBody) {
    tableBody.innerHTML = "";
  }

  demotableContent.forEach((user) => {
    const row = tableBody.insertRow();
    user.forEach((field, index) => {
      const cell = row.insertCell(index);
      cell.textContent = field;
    });
  });
}

async function projectTable(event) {
  event.preventDefault();
  const tableNameValue = document.getElementById("resultTableName").value;
  const columnNameValue = document.getElementById("resultColumnNames").value;
  const tableElement = document.getElementById("resultsTable");
  const tableBody = tableElement.querySelector("tbody");
  const thead = tableElement.querySelector("thead");
  const response = await fetch("/projectTable", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      tableName: tableNameValue,
      columnName: columnNameValue,
    }),
  });
  const responseData = await response.json();
  const demotableContent = responseData.data;
  const demotableHeaders = columnNameValue.split(",");
  if (thead) {
    thead.innerHTML = "";
  }
  const headerRow = thead.insertRow();
  demotableHeaders.forEach((header) => {
    const th = document.createElement("th");
    th.textContent = header;
    headerRow.appendChild(th);
  });
  if (tableBody) {
    tableBody.innerHTML = "";
  }
  demotableContent.forEach((user) => {
    const row = tableBody.insertRow();
    user.forEach((field, index) => {
      const cell = row.insertCell(index);
      cell.textContent = field;
    });
  });

  const messageElement = document.getElementById("projectTableMsg");
  if (responseData.success) {
    messageElement.textContent = "Table projected successfully!";
  } else {
    messageElement.textContent = "Error projecting table!";
  }
}

async function insertHomeMadeFoodName(event) {
  event.preventDefault();

  const userIDValue = document.getElementById("insertUserID1").value;
  const mealNameValue = document.getElementById("insertMealName1").value;
  const mealPlanNameValue = document.getElementById(
    "insertMealPlanName1"
  ).value;
  const foodNameValue = document.getElementById("insertFoodName1").value;
  const recipeNameValue = document.getElementById("insertRecipeName").value;
  const ingredientNameValue = document.getElementById(
    "insertIngredientName"
  ).value;
  const groceryStoreNameValue = document.getElementById(
    "insertGroceryStoreName"
  ).value;
  const groceryStoreAddressValue = document.getElementById(
    "insertGroceryStoreAddress"
  ).value;
  const quantityValue = document.getElementById("insertQuantity").value;
  const priceValue = document.getElementById("insertPrice").value;

  const response = await fetch("/insert-homeMadeFoodName", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      userID: userIDValue,
      mealName: mealNameValue,
      mealPlanName: mealPlanNameValue,
      foodName: foodNameValue,
      recipeName: recipeNameValue,
      ingredientName: ingredientNameValue,
      groceryStoreName: groceryStoreNameValue,
      groceryStoreAddress: groceryStoreAddressValue,
      quantity: quantityValue,
      price: priceValue,
    }),
  });

  const responseData = await response.json();
  const messageElement = document.getElementById("insertResultMsg");

  if (responseData.success) {
    messageElement.textContent = "Home-made food name inserted successfully!";
    displayTable("resultsTable", "/resultsTableR15");
  } else {
    messageElement.textContent = "Error inserting home-made food name data!";
  }
}

async function insertRestaurantFoodName(event) {
  event.preventDefault();

  const userIDValue = document.getElementById("insertUserID2").value;
  const mealNameValue = document.getElementById("insertMealName2").value;
  const mealPlanNameValue = document.getElementById(
    "insertMealPlanName2"
  ).value;
  const foodNameValue = document.getElementById("insertFoodName2").value;
  const restaurantNameValue = document.getElementById(
    "insertRestaurantName"
  ).value;
  const restaurantAddressValue = document.getElementById(
    "insertRestaurantAddress"
  ).value;

  const response = await fetch("/insert-restaurantFoodName", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      userID: userIDValue,
      mealName: mealNameValue,
      mealPlanName: mealPlanNameValue,
      foodName: foodNameValue,
      restaurantName: restaurantNameValue,
      restaurantAddress: restaurantAddressValue,
    }),
  });

  const responseData = await response.json();
  const messageElement = document.getElementById("insertResultMsg");

  if (responseData.success) {
    messageElement.textContent = "Data inserted successfully!";
    displayTable("resultsTable", "/resultsTableR14");
  } else {
    messageElement.textContent = "Error inserting data!";
  }
}

async function deleteMealPlan(event) {
  event.preventDefault();

  const userIDValue = document.getElementById("deleteMealPlanUserID").value;
  const mealPlanNameValue = document.getElementById("deleteMealPlanName").value;

  const response = await fetch("/delete-mealPlan", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      userID: userIDValue,
      mealPlanName: mealPlanNameValue,
    }),
  });

  const responseData = await response.json();
  const messageElement = document.getElementById("deleteResultMsg");

  if (responseData.success) {
    messageElement.textContent = "Meal plan deleted successfully!";
    displayTable("resultsTable", "/resultsTableR3");
  } else {
    messageElement.textContent = "Error deleting data :(";
  }
}

// Updates names in the demotable.
async function updateUserDemotable(event) {
  event.preventDefault();

  const columnNameValue = document.getElementById("updateColumn").value;
  const oldValueValue = document.getElementById("updateOld").value;
  const newValueValue = document.getElementById("updateNew").value;

  const response = await fetch("/update-r2", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      columnName: columnNameValue,
      oldValue: oldValueValue,
      newValue: newValueValue,
    }),
  });

  const responseData = await response.json();
  const messageElement = document.getElementById("updateNameResultMsg");

  if (responseData.success) {
    messageElement.textContent = "Name updated successfully!";
    displayTable("resultsTable", "/resultsTableR2");
  } else {
    messageElement.textContent = "Error updating name!";
  }
}

// Counts rows in the demotable.
// Modify the function accordingly if using different aggregate functions or procedures.
async function countDemotable() {
  const response = await fetch("/count-demotable", {
    method: "GET",
  });

  const responseData = await response.json();
  const messageElement = document.getElementById("countResultMsg");

  if (responseData.success) {
    const tupleCount = responseData.count;
    messageElement.textContent = `The number of tuples in demotable: ${tupleCount}`;
  } else {
    alert("Error in count demotable!");
  }
}

async function getGroupingAggrResult(event) {
    console.log("Enter function.")
    event.preventDefault();

    const tableElement = document.getElementById('resultsTable');
    const tableHeader = document.getElementById('resultsTable-header');
    const tableBody = tableElement.querySelector('tbody');
    const userIdValue = document.getElementById('userIdGroupingInput').value;

    console.log("User: ", userIdValue);

    const response = await fetch('/getMaxCaloriesInRestaurantMealPlan', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            userId: userIdValue
        })
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('groupingAggrResult');

    console.log("Group aggreg.", responseData);

    if (responseData.success) {
        messageElement.textContent = "Grouping with aggregation executed successfully!";
        
        if (tableBody) {
            tableBody.innerHTML = '';
        }

        if (tableHeader) {
            tableHeader.innerHTML = '';
            const row = tableHeader.insertRow();
            const metadata = responseData.data.metaData;
            
            for (let i = 0; i < metadata.length; i++) {
                const headerCell = document.createElement('th');
                headerCell.textContent = metadata[i]['name'];
                row.appendChild(headerCell);
            }
        }
    
        responseData.data.rows.forEach(data => {
            const row = tableBody.insertRow();
            data.forEach((field, index) => {
                const cell = row.insertCell(index);
                cell.textContent = field;
            });
        });

    } else {
        messageElement.textContent = "Error executing the grouping with aggregation!";
    }
}

async function DisplayJoined() {
    //console.log("something should be here");
    const tableElement = document.getElementById("queryTable");
    const tableBody = tableElement.querySelector("tbody")

    //console.log("something should be here ");

    const response = await fetch("/joinedQuery", {
        method: "GET"
    })
    //console.log(response);
    const responseData = await response.json();
    //console.log("something should be here as well");
    const joinedTableContent = responseData.data;
    //console.log(joinedTableContent);
    if(tableBody) {
        tableBody.innerHTML = "";
    }

    joinedTableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    })

}

async function findGreaterPrice(event) {
    event.preventDefault();

    const amountValue = document.getElementById('insertAmount').value;

    const response = await fetch('/aggregate-having', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            amount: amountValue
        })
    });

    if (!response.ok) {
        console.log("failed");
        return;
    }
    const responseData = await response.json();

    console.log("stores retrieved succesfully");
    displayStoreData(responseData);
}

async function displayStoreData(responseData) {
    //console.log("something should be here");
    const tableElement = document.getElementById("storeTable");
    const tableBody = tableElement.querySelector("tbody")

    //console.log("something should be here ");
    //console.log("something should be here as well");
    const storeTableContent = responseData.data;
    console.log(responseData);
    //console.log(joinedTableContent);
    if(tableBody) {
        tableBody.innerHTML = "";
    }

    storeTableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    })
}

async function displayMaxAvg() {
  const tableElement = document.getElementById("maxAverage");
  const tableBody = tableElement.querySelector("tbody")

  const response = await fetch("/aggregate-groupby",{
    method: "GET"
  })

  const responseData = await response.json();
    //console.log("something should be here as well");
  const maxAverageContent = responseData.data;
    //console.log(joinedTableContent);
  if(tableBody) {
        tableBody.innerHTML = "";
  }

  maxAverageContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    })
}

// ---------------------------------------------------------------
// Initializes the webpage functionalities.
// Add or remove event listeners based on the desired functionalities.
window.onload = function () {
  checkDbConnection();
  document
    .getElementById("insertHomeMade")
    .addEventListener("submit", insertHomeMadeFoodName);
  document
    .getElementById("insertRestaurant")
    .addEventListener("submit", insertRestaurantFoodName);
  document
    .getElementById("updateUserDemotable")
    .addEventListener("submit", updateUserDemotable);
  document
    .getElementById("countDemotable")
    .addEventListener("click", countDemotable);
  document
    .getElementById("resultTableR14")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR14");
    });
  document
    .getElementById("resultTableR15")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR15");
    });
  document
    .getElementById("resultTableR12")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR12");
    });
  document
    .getElementById("resultTableR10")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR10");
    });
  document
    .getElementById("resultTableR3")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR3");
    });
  document
    .getElementById("resultTableR2")
    .addEventListener("click", function () {
      displayTable("resultsTable", "/resultsTableR2");
    });
  document
    .getElementById("deleteMealPlan")
    .addEventListener("click", deleteMealPlan);
  document
    .getElementById("projectTable")
    .addEventListener("submit", projectTable);
    
  document.getElementById("groupingAggrForm").addEventListener("click", getGroupingAggrResult);

  document.getElementById("getJoined").addEventListener("click", DisplayJoined);
  document.getElementById("insertStoreTable").addEventListener("submit", findGreaterPrice);
  document.getElementById("getMaxAverage").addEventListener("click", displayMaxAvg);
};

// General function to refresh the displayed table data.
// You can invoke this after any table-modifying operation to keep consistency.
function fetchTableData() {
  fetchAndDisplayUsers();
}

// This function resets or initializes the demotable.
// async function resetDemotable() {
//     const response = await fetch("/initiate-demotable", {
//         method: 'POST'
//     });
//     const responseData = await response.json();

//     if (responseData.success) {
//         const messageElement = document.getElementById('resetResultMsg');
//         messageElement.textContent = "demotable initiated successfully!";
//         fetchTableData();
//     } else {
//         alert("Error initiating table!");
//     }
// }

// Inserts new records into the demotable.
// async function insertDemotable(event) {
//     event.preventDefault();

//     const idValue = document.getElementById('insertId').value;
//     const nameValue = document.getElementById('insertName').value;
//     const text1Value = document.getElementById('insertText1').value;
//     const text2Value = document.getElementById('insertText2').value;

//     const response = await fetch('/insert-demotable', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify({
//             id: idValue,
//             name: nameValue,
//             text1: text1Value,
//             text2: text2Value
//         })
//     });

//     const responseData = await response.json();
//     const messageElement = document.getElementById('insertResultMsg');

//     if (responseData.success) {
//         messageElement.textContent = "Data inserted successfully!";
//         fetchTableData();
//     } else {
//         messageElement.textContent = "Error inserting data!";
//     }
// }
