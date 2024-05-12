import 'package:flutter/material.dart';

class CheckoutRadioTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String title;
  final String subTitle;
  const CheckoutRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(subTitle),
    );
  }
}

Widget customRadioTile(
  int value,
  int groupValue,
  Function(int?) onChanged,
  String title,
  String subTitle,
) {
  return RadioListTile(
    value: value,
    groupValue: groupValue,
    onChanged: onChanged,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(subTitle),
  );
}
