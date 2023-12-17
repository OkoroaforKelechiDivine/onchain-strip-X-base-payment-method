import 'package:pay_me_mobile/core/di/locator.dart';

class Permissions {
  final String activateAndDeactivateUsers = "ACTIVATE_AND_DEACTIVATE_USERS";
  final String createRole = "CREATE_ROLE";
  final String canTransfer = "CAN_TRANSFER";
  final String canInitiatePayment = "CAN_INITIATE_PAYMENT";
  final String canApprovePayment = "CAN_APPROVE_PAYMENT";
  final String deactivateDevice = "DEACTIVATE_DEVICE";
  final String viewAllTransactions = "VIEW_ALL_TRANSACTIONS";
  final String viewReports = "VIEW_REPORTS";
  final String canSetTransactionPin = "CAN_SET_TRANSACTION_PIN";
  final String viewPosDevices = "VIEW_POS_DEVICES";
  final String canViewOutlets = "CAN_VIEW_OUTLETS";
  final String canSetTransferLimit = "CAN_SET_TRANSFER_LIMIT";
  final String canViewBalance = "CAN_VIEW_BALANCE";

  final userPermissions = appGlobals.user!.permissions;

  bool hasPermission(String permission) {
    return userPermissions!.isEmpty || userPermissions!.contains(permission);
  }

  bool canUserActivateAndDeactivateUsers() =>
      hasPermission(activateAndDeactivateUsers);
  bool canUserCreateRole() => hasPermission(createRole);
  bool canUserTransfer() => hasPermission(canTransfer);
  bool canUserInitiatePayment() => hasPermission(canInitiatePayment);
  bool canUserApprovePayment() => hasPermission(canApprovePayment);
  bool canUserDeactivateDevice() => hasPermission(deactivateDevice);
  bool canUserViewAllTransactions() => hasPermission(viewAllTransactions);
  bool canUserViewReports() => hasPermission(viewReports);
  bool canUserSetTransactionPin() => hasPermission(canSetTransactionPin);
  bool canUserViewPosDevices() => hasPermission(viewPosDevices);
  bool canUserViewOutlets() => hasPermission(canViewOutlets);
  bool canUserSetTransferLimit() => hasPermission(canSetTransferLimit);
  bool canUserViewBalance() => hasPermission(canViewBalance);
}
