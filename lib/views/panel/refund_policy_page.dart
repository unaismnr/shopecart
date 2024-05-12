import 'package:flutter/material.dart';

import 'widgets/panel_pages_app_bar.dart';

class RefundPolicyPage extends StatelessWidget {
  const RefundPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: panelPagesAppBar('Refund Policy', context),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'At Shopecart, we strive to provide the best shopping experience for our customers. If you are not entirely satisfied with your purchase, we are here to help.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Refund Eligibility',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'To be eligible for a refund, the following conditions must be met:',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- The item must be unused and in the same condition that you received it.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- The item must be in the original packaging.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- The item must have the receipt or proof of purchase.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Refund Process',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'To request a refund, please contact our customer support team within [number of days] days of receiving the item. You may be asked to provide additional information or documentation to support your refund request.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Once your refund request is approved, we will initiate a refund to your original method of payment. Please note that it may take [number of days] for the refund to be processed and reflected in your account.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions, concerns, or feedback regarding our refund policy, please contact us at contact@shopecart.com.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 200.0),
          ],
        ),
      ),
    );
  }
}
