import 'package:flutter/material.dart';
import 'widgets/panel_pages_app_bar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: panelPagesAppBar(
        'Privacy Policy',
        context,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'At Shopecart, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our services.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Personal Information: When you create an account, place an order, or interact with our platform, we may collect personal information such as your name, email address, shipping address, and payment details.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- Transaction Information: We collect details about your purchases, including product details, order history, and payment transactions.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- Usage Information: We may collect information about how you interact with our app, such as your browsing activity, preferences, and device information.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Order Processing: We use your personal information to process orders, deliver products, and provide customer support.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- Personalization: We may use your information to personalize your shopping experience, recommend products, and send you tailored offers and promotions.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '- Communication: We may use your contact information to send you order updates, newsletters, marketing communications, and important notifications related to your account.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Security',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We take the security of your personal information seriously and have implemented technical and organizational measures to protect your data against unauthorized access, disclosure, or alteration.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Third-Party Services',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may use third-party services to facilitate payment processing, order fulfillment, analytics, and advertising. These third parties are required to handle your data securely and are prohibited from using it for any other purpose.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Choices',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'You have the right to access, update, or delete your personal information at any time. You can manage your communication preferences and opt-out of promotional emails by adjusting your account settings or contacting customer support.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Updates to This Privacy Policy',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may update this Privacy Policy periodically to reflect changes in our practices or legal requirements. We will notify you of any significant updates through our app or by email.',
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
              'If you have any questions, concerns, or feedback regarding this Privacy Policy or our privacy practices, please contact us at contact@shopecart.com.',
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
