class ApiRoutes {
  static var login = "/auth/login";
  static var enterPasscode = "/auth/validate_passcode";
  static var getAllBanks = "/api/get_all_banks";
  static var getAllBillers = "/transaction/get-biller-list/AIRTIME";
  static var payBills = "/transaction/pay-bill";

  static String getBillerItems(String billerId, String divisionId, String productId) {
    return "/transaction/get-biller-item?billerId=$billerId&divisionId=$divisionId&productId=$productId";
  }
}