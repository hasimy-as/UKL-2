import express from "express";
import bodyParser from "body-parser";
import session from "express-session";

import db from "./database/db";
import Route from "./routes/Route";

const Index = express();
const PORT = process.env.PORT || 3001;

Index.set("view engine", "ejs");
Index.use(express.static("public"));
Index.use(
  bodyParser.urlencoded({
    extended: false
  })
);
Index.use(bodyParser.json());
Index.use(
  session({
    secret: "secret",
    resave: true,
    saveUninitialized: true
  })
);

Index.use("/", Route).listen(PORT, () =>
  console.log(`server ada di localhost:${PORT} cuy`)
);
