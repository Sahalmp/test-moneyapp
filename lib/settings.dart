import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyapp/view/widgets/searchTextFieldWidget.dart';

import 'model/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: secondary,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                              radius: 40, backgroundImage: NetworkImage(image)),
                        ),
                      ),
                      Text(
                        'Mae Jamison',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 2,
                            fontSize: 20),
                      ),
                      Text('maj@gmail.com'),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: SearchFieldWidget(
                    placeholder: 'Search Settings',
                  ),
                )
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            const SettingsTile(icon: Icons.person, title: 'Personal Info'),
            const SettingsTile(
                icon: Icons.qr_code_scanner_sharp, title: 'My QR Code'),
            const SettingsTile(
                icon: Icons.location_city, title: 'Banks and Cards'),
            const SettingsTile(
                icon: Icons.payments, title: 'Payment Preferences'),
            const SettingsTile(
                icon: CupertinoIcons.goforward, title: 'Automatic Payments'),
            const SettingsTile(icon: Icons.login, title: 'Login & Security'),
            const SettingsTile(
                icon: Icons.notifications, title: 'Notifications'),
          ]))
        ],
      ),
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      thickness: 1,
      height: 3,
      endIndent: 20,
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 20,
            leading: Icon(icon),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: primary,
            ),
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          SettingsDivider(),
        ],
      ),
    );
  }
}
