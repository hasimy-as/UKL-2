import mysql from "mysql";

let db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "logincrud",
  multipleStatements: true
});

db.connect(err => {
  if (err) throw err;
  console.info("terkoneksikan!");
});

export default db;
