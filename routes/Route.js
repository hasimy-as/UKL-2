import express from "express";
import alert from "alert-node";
import db from "../database/db";

const Route = express.Router();

Route.get("/login", (req, res) => res.render("login"));

Route.get("/input", (req, res) => res.render("input"));

Route.get("/langgar", (req, res) => res.render("inputlanggar"));

Route.get("/register", (req, res) => res.render("register"));

Route.get("/tambah", (req, res) => res.render("tambahsiswa"));

Route.get("/", (req, res) => {
  if (req.session.loggedin) {
    res.render("homepage");
  } else {
    alert("Silahkan masuk dulu!");
    res.redirect("/login");
  }
});

var siswa = {};
Route.get("/siswa", (req, res) => {
  const sql = "SELECT * FROM siswa";
  db.query(sql, (err, rows) => {
    if (err) throw err;
    siswa = { print: rows };
    res.render("siswa", siswa);
  });
});

var petugas = {};
Route.get("/petugas", (req, res) => {
  const sql = "SELECT * FROM user";
  db.query(sql, (err, rows) => {
    if (err) throw err;
    petugas = { printP: rows };
    res.render("petugas", petugas);
  });
});

var pelanggar = {};
Route.get("/pelanggaran", (req, res) => {
  const sql = "SELECT * FROM pelanggaran";
  db.query(sql, (err, rows) => {
    if (err) throw err;
    pelanggar = { printPel: rows };
    res.render("pelanggar", pelanggar);
  });
});

Route.post("/auth", (req, res) => {
  let email = req.body.email;
  let password = req.body.password;
  const sql = "SELECT * FROM user WHERE email = ? AND password = ?";
  if (email && password) {
    db.query(sql, [email, password], (err, rows) => {
      if (err) throw err;
      if (rows.length > 0) {
        req.session.loggedin = true;
        req.session.email = email;
        res.redirect("/");
      } else {
        alert("Data anda salah!");
        res.redirect("/login");
      }
      res.end();
    });
  }
});

Route.post("/authSiswa", (req, res) => {
  let dataRegister = {
    nis: req.body.nis,
    nama_siswa: req.body.nama,
    kelas: req.body.kelas,
    langgar: req.body.langgar
  };
  db.query("INSERT INTO user SET ?", dataRegister, (err, results) => {
    if (err) throw err;
    console.log("data berhasil masuk dengan hasil", results);
    alert("Siswa teregistrasi!");
    res.redirect("/siswa");
  });
});

Route.post("/authLanggar", (req, res) => {
  let dataRegister = {
    nama_pelanggaran: req.body.nama_pelanggaran,
    kategori: req.body.kategori,
    poin: req.body.poin
  };
  db.query("INSERT INTO pelanggaran SET ?", dataRegister, (err, results) => {
    if (err) throw err;
    console.log("data berhasil masuk dengan hasil", results);
    alert("Pelanggaran teregistrasi!");
    res.redirect("/pelanggaran");
  });
});

Route.post("/authreg", (req, res) => {
  let dataRegister = {
    name: req.body.nama,
    email: req.body.email,
    password: req.body.password,
    role: req.body.tugas
  };
  db.query("INSERT INTO user SET ?", dataRegister, (err, results) => {
    if (err) throw err;
    console.log("data berhasil masuk dengan hasil", results);
    alert("Data teregistrasi!");
    res.redirect("/petugas");
  });
});

Route.get("/hapusPel/:id", (req, res) => {
  const { id } = req.params;
  const hapus = `DELETE from pelanggaran WHERE id  = ?`;
  db.query(hapus, [id], (err, rows) => {
    if (err) throw err;

    console.log("Rows dihapus:", rows.affectedRows);
    res.redirect("/pelanggaran");
  });
});

Route.get("/hapusP/:id", (req, res) => {
  const { id } = req.params;
  const hapus = `DELETE from user WHERE id  = ?`;
  db.query(hapus, [id], (err, rows) => {
    if (err) throw err;

    console.log("Rows dihapus:", rows.affectedRows);
    res.redirect("/petugas");
  });
});

Route.get("/hapusS/:id", (req, res) => {
  const { id } = req.params;
  const hapus = `DELETE from siswa WHERE id  = ?`;
  db.query(hapus, [id], (err, rows) => {
    if (err) throw err;

    console.log("Rows dihapus:", rows.affectedRows);
    res.redirect("/siswa");
  });
});

Route.post("/editPel", (req, res) => {
  let sql =
    'update pelanggaran set nama_pelanggaran="' +
    req.body.nama_pelanggaran +
    '", kategori="' +
    req.body.kategori +
    '", poin="' +
    req.body.poin +
    '" where id=' +
    req.body.id;
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    alert("data berhasil diubah!");
    res.redirect("/pelanggaran");
  });
});

Route.post("/editP/:id", (req, res) => {
  let sql =
    'update user set name="' +
    req.body.name +
    '", email="' +
    req.body.email +
    '", password="' +
    req.body.password +
    '", role="' +
    req.body.role +
    '" where id=' +
    req.body.id;
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    alert("data berhasil diubah!");
    res.redirect("/petugas");
  });
});

Route.post("/editS/:id", (req, res) => {
  let sql =
    'update siswa set nis="' +
    req.body.nis +
    '", nama_siswa="' +
    req.body.nama_siswa +
    '", kelas="' +
    req.body.kelas +
    '" where id=' +
    req.body.id;
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    alert("data berhasil diubah!");
    res.redirect("/siswa");
  });
});

Route.get("/logout", (req, res) => {
  req.session.destroy(err => {
    if (err) throw err;
    res.redirect("/login");
  });
});

export default Route;
