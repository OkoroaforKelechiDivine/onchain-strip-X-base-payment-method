import 'package:get_it/get_it.dart';
import 'package:pay_me_mobile/data/datasources/local/app_local_storage.dart';
import 'package:pay_me_mobile/data/datasources/local/auth_local_storage.dart';
import 'package:pay_me_mobile/data/repo/admin_repo.dart';
import 'package:pay_me_mobile/data/repo/auth_repo.dart';
import 'package:pay_me_mobile/data/repo/bank_repo.dart';
import 'package:pay_me_mobile/data/repo/business_repo.dart';
import 'package:pay_me_mobile/data/repo/invoice_repo.dart';
import 'package:pay_me_mobile/data/repo/pos_repo.dart';
import 'package:pay_me_mobile/data/repo/role_repo.dart';
import 'package:pay_me_mobile/data/repo/ticket_repo.dart';
import 'package:pay_me_mobile/data/repo/transaction_repo.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/datasources/remote/authentication_data_provider.dart';
import '../cores.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthenticationDataProvider>(
      () => AuthenticationDataProvider());
  //locator.registerLazySingleton<TransferDataProvider>(() => TransferDataProvider());

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
  locator.registerLazySingleton<BottomSheetService>(() => BottomSheetService());

  //STORAGES
  locator.registerLazySingleton(() => AuthLocalStorage());
  locator.registerLazySingleton(() => AppLocalStorage());
  //GLOBALS
  locator.registerLazySingleton(() => AppGlobals.instance);

  //REPOS
  locator.registerLazySingleton(() => AuthRepo());
  locator.registerLazySingleton(() => BankRepo());
  locator.registerLazySingleton(() => BusinessRepo());
  locator.registerLazySingleton(() => TransactionRepo());
  locator.registerLazySingleton(() => TicketRepo());
  locator.registerLazySingleton(() => POSRepo());
  locator.registerLazySingleton(() => InvoiceRepo());
  locator.registerLazySingleton(() => RoleRepo());
  locator.registerLazySingleton(() => AdminRepo());
}

//GLOBALS
AppGlobals appGlobals = locator.get<AppGlobals>();

NavigationService navigationService = locator.get<NavigationService>();
SnackbarService snackbarService = locator.get<SnackbarService>();
BottomSheetService bottomSheetService = locator.get<BottomSheetService>();

//STORAGES
AuthLocalStorage authLocalStorage = locator.get<AuthLocalStorage>();
AppLocalStorage appLocalStorage = locator.get<AppLocalStorage>();

//REPOS
AuthRepo authRepo = locator.get<AuthRepo>();
BankRepo bankRepo = locator.get<BankRepo>();
BusinessRepo businessRepo = locator.get<BusinessRepo>();
TransactionRepo transactionRepo = locator.get<TransactionRepo>();
TicketRepo ticketRepo = locator.get<TicketRepo>();
POSRepo posRepo = locator.get<POSRepo>();
InvoiceRepo invoiceRepo = locator.get<InvoiceRepo>();
RoleRepo roleRepo = locator.get<RoleRepo>();
AdminRepo adminRepo = locator.get<AdminRepo>();
