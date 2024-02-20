import 'package:flutter/material.dart';
import 'package:shopecart/views/pages/my_account.dart';
import 'package:shopecart/views/pages/privacy_policy_page.dart';
import 'package:shopecart/views/pages/refund_policy_page.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';
import 'package:shopecart/views/widgets/panel_custom_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopecart/views/widgets/signout.dart';
import '../widgets/custom_app_bar.dart';
import 'about_us_page.dart';
import 'contact_us_page.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "Panel",
        context,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              cstomHeading('ACCOUNTS'),
              const SizedBox(height: 5),
              customContainer(
                height: 55,
                context,
                PanelCustomButton(
                  icon: Icons.person_2_outlined,
                  text: 'My Account',
                  onTap: () {
                    NavigationHelper.push(
                      context,
                      const MyAccount(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              cstomHeading('GENERAL'),
              const SizedBox(height: 5),
              customContainer(
                context,
                Column(
                  children: [
                    const SizedBox(height: 5),
                    PanelCustomButton(
                      icon: Icons.share,
                      text: 'Share App',
                      onTap: () {
                        Share.share(
                            'https://github.com/unaismnr/shopecart-app');
                      },
                    ),
                    const Divider(),
                    PanelCustomButton(
                      icon: Icons.privacy_tip_outlined,
                      text: 'Privacy Policy ',
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          const PrivacyPolicyPage(),
                        );
                      },
                    ),
                    const Divider(),
                    PanelCustomButton(
                      icon: Icons.currency_exchange,
                      text: 'Refund Policy ',
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          const RefundPolicyPage(),
                        );
                      },
                    ),
                    const Divider(),
                    PanelCustomButton(
                      icon: Icons.contact_support_outlined,
                      text: 'Contact Us',
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          const ContactUsPage(),
                        );
                      },
                    ),
                    const Divider(),
                    PanelCustomButton(
                      icon: Icons.info_outline,
                      text: 'About Us',
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          const AboutUsPage(),
                        );
                      },
                    ),
                    const Divider(),
                    PanelCustomButton(
                      icon: Icons.power_settings_new,
                      text: 'Logout',
                      onTap: () {
                        signOut(context);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cstomHeading(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget customContainer(
  BuildContext context,
  Widget button, {
  double? height,
}) {
  return Container(
    height: height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 235, 235, 235),
          spreadRadius: .1,
          blurRadius: 10,
        ),
      ],
      color: Colors.white,
    ),
    child: button,
  );
}
