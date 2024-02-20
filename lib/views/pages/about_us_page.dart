import 'package:flutter/material.dart';

import '../widgets/panel_pages_app_bar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: panelPagesAppBar('About Us', context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/Images/shop_ecart.png',
                ),
              ),
            ),
            const Center(
              child: Text(
                'Welcome to Shopecart!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Shopecart is your one-stop destination for all your shopping needs. We offer a wide range of products, including clothing, electronics, gadgets, and much more. Our mission is to provide our customers with high-quality products at affordable prices, along with excellent customer service.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
