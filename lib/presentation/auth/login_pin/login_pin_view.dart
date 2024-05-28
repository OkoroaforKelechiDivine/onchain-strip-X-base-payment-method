import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_view.dart';
import 'package:stacked/stacked.dart';
import 'login_pin_viewmodel.dart';

class LoginPinView extends StatelessWidget {
  const LoginPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPinViewModel>.reactive(
      viewModelBuilder: () => LoginPinViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 32 + 56),

              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: AppText(
                  'Enter your Login Pin',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: GestureDetector(
                  onTap: () async {
                    await LocalStorageService.clear();
                    navigationService.pushAndRemoveUntil(const SignInView());
                  },
                  child: Row(
                    children: [
                      AppText(
                        'Not your Account?',
                        color: AppColors.welcomeGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const AppText(
                        '  Log out',
                        color: AppColors.lightGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 51),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: index < viewModel.pin.length
                          ? Colors.black
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 54,
                    crossAxisSpacing: 54,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 9) {
                      return GestureDetector(
                        onTap: () {
                          // Implement fingerprint authentication logic here
                        },
                        child: const Icon(
                          Icons.fingerprint,
                          size: 32,
                        ),
                      );
                    } else if (index == 10) {
                      return GestureDetector(
                        onTap: () => viewModel.addDigit('0'),
                        child: CircleAvatar(
                          backgroundColor: AppColors.pinBg,
                          child: AppText(
                            '0',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      );
                    } else if (index == 11) {
                      return GestureDetector(
                        onTap: viewModel.removeDigit,
                        child: const Icon(Icons.backspace),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () => viewModel.addDigit('${index + 1}'),
                        child: CircleAvatar(
                          backgroundColor: AppColors.pinBg,
                          child: AppText(
                            '${index + 1}',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}
