import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/data_provider/authentication_data_provider.dart';
import 'data/view_models/auth/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// register services
  locator.registerLazySingleton<AuthenticationDataProvider>(
          () => AuthenticationDataProvider());
}

final allProviders = <SingleChildWidget>[

  ///authentication view models
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
];