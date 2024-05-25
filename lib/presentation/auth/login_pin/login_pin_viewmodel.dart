import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/presentation/bottom_nav.dart';
import 'package:stacked/stacked.dart';

class LoginPinViewModel extends BaseViewModel {
  String _pin = '';
  String get pin => _pin;

  void addDigit(String digit) {
    if (_pin.length < 6) {
      _pin += digit;
      notifyListeners();

      if (_pin.length == 6) {
        submitPin();
      }
    }
  }

  void removeDigit() {
    if (_pin.isNotEmpty) {
      _pin = _pin.substring(0, _pin.length - 1);
      notifyListeners();
    }
  }

  void clearPin() {
    _pin = '';
    notifyListeners();
  }

  bool get isPinComplete => _pin.length == 6;

  void submitPin() {
    if (isPinComplete) {
      navigationService.pushAndRemoveUntil(const BottomNav());
    }
  }
}
