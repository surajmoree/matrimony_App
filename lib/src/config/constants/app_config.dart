const appEnv = "staging"; // staging, dev , prod

const String httpProtocol = 'https';
const String host =
    (appEnv != "prod") ? "api-$appEnv.tartoob.com" : "api.tartoob.com";
  const String socketUrl = (appEnv != "prod")
    ? "socket-$appEnv.tartoob.com"
    : "socket.tartoob.com";

// for local
// const String httpProtocol = 'http';
// const String host = '192.168.1.101:8001';
// const String socketUrl = "192.168.1.101:8089";

const String s3Region = "ap-south-1";
const String s3Url =
  "social-media-resource.s3.ap-south-1.amazonaws.com";