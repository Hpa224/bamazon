let mysql = require("mysql");
let inquirer = require("inquirer");
let query;
let itemamount;
let message1 = "We're Sorry but we don't seem to have enough in stock. Please choose a lower amount or another item"
let count = 0

let con = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "password",
    database: "bamazon_db"
    })

con.connect(function (ermac) {
    if (ermac) throw ermac;
        console.log(`connected as id ${con.threadid}`);

    queryall()
    })


let inquiry = () => {
inquirer
    .prompt([
    {
        type: "input",
        message: "Please input the ID of the product you'd like to purchase.",
        name: "order"
    },
    {
        type: "input",
        message: "how many would you like to purchase?",
        name: "amount"
    }
    ])
    .then(function(input) {
        lastid = input.order
        retriever(input.order, () => {
            if (input.amount > itemamount) {
                console.log("We're Sorry but we don't seem to have enough in stock.")
                inquiry()
            } 
            else {
                console.log("Thank you! Your order has been placed!")
                update(input.amount,input.order)
                }
        })
    });
}
inquiry()



let queryall = () => {
    query = "SELECT * FROM inventory";
    con.query(query, function(ermac, res) {
        if (ermac) throw ermac;
        // console.log(res)

        for (let i = 0; i < res.length; i++) {
            console.log(
            `                                                    
            ${res[i].id} | ${res[i].Product} | ${res[i].Department} | $${res[i].Prices} | ${res[i].Stock} In stock`);
            }
        });

    // console.log(query)
    }

let update = (amount, itemid) => {
    query = `UPDATE inventory SET stock = stock - ${amount} WHERE id = ${itemid}`;

    con.query(query, function(ermac, res) {
        if (ermac) throw ermac;

        queryall();
        // console.log(res.affectedRows);
        });

    // console.log(query);
}

let retriever = (id, callback) => {
    query = "SELECT * FROM inventory";

    con.query(query, function(ermac, res) {
        itemamount = res[id-1].Stock;
        // console.log(itemamount + " This is how many are in stock")
        callback()
        });
    }

