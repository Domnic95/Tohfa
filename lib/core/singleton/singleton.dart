import '../../export.dart';
import '../../features/auth/sign_in/model/customer_site_id_model.dart';

class Singleton {
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  static Singleton get instance => _instance;
  String token = "";
  CustomerSiteIdModel? userData;
  UserOtherDataModel? userOtherData;
  String deviceToken = "";
  int dashBoardIndex = 0;

  Map tempRegData = {};

  Future<void> appInit() async {
    await SharedPref.instance.getUserData();
    await SharedPref.instance.getUserOtherData();
    token = await SharedPref.instance.getUserToken() ?? "";
    // await SharedPref.instance.clearPref();
  }

  ///auth headers
  Map<String, String> getAuthHeaders({bool withType = false}) {
    log(token, name: "TOKEN IN HEADER");
    return {
      // if (token.isNotEmpty) SharedKey.authorization: "Bearer $token",
      // if (token.isNotEmpty) SharedKey.authorization: token,
      if (token.isNotEmpty) SharedKey.authorization: "Bearer $token",
      "Accept": "application/json",
      if (withType) "Content-Type": "application/json",
    };
  }
}
