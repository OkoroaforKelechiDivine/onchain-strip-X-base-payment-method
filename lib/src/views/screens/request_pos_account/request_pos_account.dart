import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/request_pos_account/request_pos_account_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class RequestPOSOrAccountView extends StatelessWidget {
  const RequestPOSOrAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RequestForAccountPOSVM(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            //title: const Text('Request for POS or Account'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const AppText(
                    'Request For Account/POS',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8.0),
                  const AppText(
                    'Request for account or Pos and we\'ll wrap it up for you',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 24.0),
                  const AppText("Enter First Name"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.firstnameController,
                    hintText: 'Enter First name',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter Last Name"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.lastnameController,
                    hintText: 'Enter Last Name ',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter Email"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.emailnameController,
                    hintText: 'Enter Email Address',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter Phone Number"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.phoneController,
                    hintText: 'Enter Phone Number',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter Business Address"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.businessAddressController,
                    hintText: 'Enter Business Address',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter State"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.stateController,
                    hintText: 'Enter State',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Request Type"),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const AppText("Account"),
                          leading: Radio(
                            activeColor: AppColors.lightGreen,
                            value: 'account',
                            groupValue: model.requestType,
                            onChanged: (String? value) {
                              model.setRequestType(value!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const AppText("POS"),
                          leading: Radio(
                            activeColor: AppColors.lightGreen,
                            value: 'pos',
                            groupValue: model.requestType,
                            onChanged: (String? value) {
                              model.setRequestType(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35.0),
                  AppCustomButton(
                    onPressed: () {
                      model.requestPos();
                    },
                    color: AppColors.lightGreen,
                    loading: model.isLoading,
                    child: const AppText(
                      'Submit Request',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
