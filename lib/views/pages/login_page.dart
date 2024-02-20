import 'package:flutter/material.dart';
import 'package:shopecart/api/login_api.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/views/widgets/log_reg_text_field.dart';
import 'package:shopecart/views/pages/registration_page.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';
import '../widgets/log_reg_account_confirm.dart';
import '../widgets/log_reg_elevated_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

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
                      "Welcome Back!",
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
                      "Enter Your Login Details",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LogRegTextField(
                    controller: _usernameController,
                    hintText: "Username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid Username';
                      } else {
                        return null;
                      }
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
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegElevatedButton(
                    text: 'LOGIN',
                    onpressed: () {
                      final String username = _usernameController.text.trim();
                      final String password = _passwordController.text.trim();
                      if (_formKey.currentState!.validate()) {
                        loginApi(username, password, context);
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  LogRegAccountConfirm(
                    accountConfirmText: "Don't you have an account?",
                    onTap: () {
                      NavigationHelper.push(context, RegistrationPage());
                    },
                    loginRegisterText: "Register",
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
