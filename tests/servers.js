const host = process.env.PROD_SERVER;
const username = process.env.PROD_SERVER_USER;
const password = process.env.PROD_SERVER_PASSWORD;
const port = parseInt(process.env.PROD_SERVER_PORT, 10) || 22;

module.exports = {
  mymeteor: {
    host,
    username,
    password,
    opts: {
      port
    }
  },
  mymongo: {
    host,
    username,
    password,
    opts: {
      port
    }
  },
  myproxy: {
    host,
    username,
    password,
    opts: {
      port
    }
  }
};
