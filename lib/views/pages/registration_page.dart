import 'package:flutter/material.dart';
import 'package:shopecart/api/registration_api.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/views/pages/login_page.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';

import '../widgets/log_reg_account_confirm.dart';
import '../widgets/log_reg_elevated_button.dart';
import '../widgets/log_reg_text_field.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Account Registration",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Center(
                    child: Text(
                      "Complete Your Details",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LogRegTextField(
                    controller: _nameController,
                    hintText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegTextField(
                    controller: _phoneController,
                    hintText: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Phone Number';
                      } else if (value.length < 10 || value.length > 10) {
                        return 'Enter Valid Phone Number';
                      }
                      return null;
                    },
                    keyboradtype: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  LogRegTextField(
                    controller: _addressController,
                    hintText: 'Address',
                    height: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Address';
                      }
                      return null;
                    },
                    lines: 4,
                  ),
                  const SizedBox(height: 15),
                  LogRegTextField(
                    controller: _usernameController,
                    hintText: "Username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegElevatedButton(
                    text: "SUBMIT",
                    onpressed: () {
                      String name = _nameController.text.trim();
                      String phone = _phoneController.text.trim();
                      String address = _addressController.text.trim();
                      String username = _usernameController.text.trim();
                      String password = _passwordController.text.trim();
                      if (_formKey.currentState!.validate()) {
                        registrationApi(
                          name.toString(),
                          phone.toString(),
                          address.toString(),
                          username.toString(),
                          password.toString(),
                          context,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegAccountConfirm(
                    accountConfirmText: "Do you already have an account?",
                    onTap: () {
                      NavigationHelper.push(context, LoginPage());
                    },
                    loginRegisterText: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
