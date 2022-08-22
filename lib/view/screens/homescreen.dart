import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneyapp/view_model/bottomnavcontroller.dart';

import '../../Settings.dart';
import 'dashboard.dart';
import 'scanreciept.dart';
import 'sendrequest_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: IndexedStack(
                index: controller.tabIndex,
                children: [
                  DashboardScreen(),
                  ScanReceiptScreen(),
                  SendRequestScreen(),
                  SettingsScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                selectedLabelStyle: const TextStyle(fontSize: 12),
                unselectedLabelStyle: const TextStyle(fontSize: 10),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner_rounded),
                    label: 'Scan Reciept',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payments),
                    label: 'Send & Request',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded),
                    label: 'Settings',
                  ),
                ],
              ));
        });
  }
}
