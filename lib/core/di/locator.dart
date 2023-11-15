import 'package:get_it/get_it.dart';
import 'package:pay_me_mobile/data/data_provider/transfer_data_provider.dart';
import 'package:pay_me_mobile/src/data/view_models/bottom_nav_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/data_provider/authentication_data_provider.dart';
import '../../data/view_models/auth/login_model.dart';
import '../cores.dart';


final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthenticationDataProvider>(() => AuthenticationDataProvider());
  locator.registerLazySingleton<TransferDataProvider>(() => TransferDataProvider());


  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  
}

NavigationService navigationService = locator.get<NavigationService>();


final allProviders = <SingleChildWidget>[
  ///authentication view models
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => BottomNavViewModel()),

];