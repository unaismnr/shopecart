import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/panel_pages_app_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: panelPagesAppBar('Contact Us', context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'We would love to hear from you! If you have any questions, concerns, or feedback, please feel free to contact us.',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    emailContact();
                  },
                  icon: const Icon(Icons.mail_outline),
                  label: const Text('MAIL US'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> emailContact() async {
  if (await launchUrl(
    Uri.parse('mailto:contact@netecart.com'),
  )) {
    throw Exception('Could not launch email');
  }
}
