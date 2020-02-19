"use strict";

const express = require("express");
const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");
const csn = './gen/srv/srv/csn.json';

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 4004;

(async () => {
  const app = express();

  // serve odata v4
  await cds
    .connect("db") // ensure database is connected!
    
    await cds
    .serve('FairContactsService')
    .from(csn)
    .with('srv/service.js')
    .in(app)


  // serve odata v2
  process.env.XS_APP_LOG_LEVEL = "warning";
  app.use(proxy({
    path: "v2",
    model: csn,
    port: port, // target port
  }));

  // start server
  const server = app.listen(port, host, () => console.info(`app is listing at ${host}:${port}`));
  server.on("error", error => console.error(error.stack));
})();