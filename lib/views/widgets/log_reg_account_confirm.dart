import 'package:flutter/material.dart';
import 'package:shopecart/utils/consts.dart';

class LogRegAccountConfirm extends StatelessWidget {
  final String accountConfirmText;
  final void Function() onTap;
  final String loginRegisterText;

  const LogRegAccountConfirm({
    super.key,
    required this.accountConfirmText,
    required this.onTap,
    required this.loginRegisterText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountConfirmText,
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            loginRegisterText,
            style: TextStyle(
              color: mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
