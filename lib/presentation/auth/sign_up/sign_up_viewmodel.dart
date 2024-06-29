import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_success.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  bool isOptionSelected = false;
  TextEditingController businessName = TextEditingController();
  TextEditingController businessAddress = TextEditingController();
  TextEditingController incorporateDate = TextEditingController();
  TextEditingController incorporateDateController = TextEditingController();
  TextEditingController rcNumber = TextEditingController();
  final businessFormKey = GlobalKey<FormState>();
  final personalInfoFormKey = GlobalKey<FormState>();
  final createPinFormKey = GlobalKey<FormState>();
  int? registrationStatusIndex;

  List<String> registrationOptions = ['Registered', 'Non-registered'];
  PageController pageController = PageController();
  int currentPage = 0;
  bool isStateOptionSelected = false;
  bool isGenderOptionSelected = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController createPin = TextEditingController();
  TextEditingController confirmPin = TextEditingController();

  int? stateIndex = 0;
  int? genderIndex = 0;

  List<String> stateOptions = [
    'Abia', 'Adamawa', 'Akwa Ibom', 'Anambra', 'Bauchi', 'Bayelsa',
    'Benue', 'Borno', 'Cross River', 'Delta', 'Ebonyi', 'Edo', 'Ekiti',
    'Enugu', 'Gombe', 'Imo', 'Jigawa', 'Kaduna', 'Kano', 'Katsina', 'Kebbi',
    'Kogi', 'Kwara', 'Lagos', 'Nasarawa', 'Niger', 'Ogun', 'Ondo', 'Osun',
    'Oyo', 'Plateau', 'Rivers', 'Sokoto', 'Taraba', 'Yobe', 'Zamfara',
    'FCT (Federal Capital Territory)'
  ];
  List<String> genderOptions = ['Male', 'Female'];
  bool isLoading = false;

  void onStateChanged(int? index) {
    stateIndex = index;
    isStateOptionSelected = index != null;
    notifyListeners();
  }

  void onGenderChanged(int? index) {
    genderIndex = index;
    isGenderOptionSelected = index != null;
    notifyListeners();
  }

  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }
  }

  void navigateToPage(int page) {
    currentPage = page;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void onRegistrationStatusChanged(int? index) {
    registrationStatusIndex = index;
    isOptionSelected = index != null;
    notifyListeners();
  }

  void setIncorporateDate(String date) {
    incorporateDateController.text = date;
  }

  void setDOBDate(String date) {
    dob.text = date;
  }

  void validateForm() {
    if (currentPage == 0) {
      nextPage();
    } else if (currentPage == 1) {
      nextPage();
    } else if (currentPage == 2) {
      createAccount();
    }
  }

  void createAccount() {
    isLoading = true;
    notifyListeners();

    // Simulating a delay before navigating (you can replace this with actual async logic)
    Future.delayed(Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
      // Navigate to the success page
      navigationService.push(const SignUpSuccess());
    });
  }
}
