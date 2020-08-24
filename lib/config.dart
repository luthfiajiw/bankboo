enum Env { DEV, LOCAL }

class Config {
  // ignore: non_constant_identifier_names
  static String API = "";

  static void setEnvironment(Env env) {
    switch (env) {
      case Env.LOCAL:
        API = "http://192.168.1.21:3000/api/v1";
        break;
      case Env.DEV:
        API = "https://bankboo-api.herokuapp.com/api/v1";
        break;
      default:
    }
  }
}
