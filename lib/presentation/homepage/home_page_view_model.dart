import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  String getUserName() {
    return appGlobals.user?.username ?? "User";
  }

  String getUserProfilePicture() {
    return AppAssets.userProfile;
  }

  int _currentCarouselIndex = 0;

  int get currentCarouselIndex => _currentCarouselIndex;

  void setCarouselIndex(int index) {
    _currentCarouselIndex = index;
    notifyListeners();
  }
}
