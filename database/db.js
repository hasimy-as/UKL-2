import mysql from "mysql";

let db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "tatib_siswa",
  multipleStatements: true
});

db.connect(err => {
  if (err) throw err;
  console.info("database terkoneksi");
});

export default db;
