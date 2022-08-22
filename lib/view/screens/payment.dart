import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moneyapp/model/constants.dart';
import 'package:moneyapp/view/screens/homescreen.dart';
import 'package:moneyapp/view_model/transactioncontroller.dart';

import '../../Model/dbmodel/transactionmodel.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen(
      {Key? key,
      required this.name,
      required this.avatar,
      required this.amount})
      : super(key: key);
  final String name, avatar, amount;

  @override
  Widget build(BuildContext context) {
    final TransactionalController transactionalController =
        Get.find<TransactionalController>();
    Future.delayed(const Duration(milliseconds: 5000), () {
      transactionalController.addtransactions(TransactionModel(
          key: DateTime.now().millisecondsSinceEpoch,
          name: name,
          type: 'paid to',
          date: currentime,
          amount: amount));
      transactionalController.subfrombalance(int.parse(amount));
      Get.offAll(() => const HomeScreen());
    });
    return Theme(
      data: paymentthemeData,
      child: Scaffold(
          backgroundColor: primary,
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  AvatarGlow(
                    glowColor: Colors.white,
                    endRadius: 200.0,
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: const Duration(milliseconds: 100),
                    child: Material(
                      // Replace this child with your own
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(avatar),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Paying',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 27,
                        height: 1.8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Cancel Payment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )))
                ],
              ),
            ),
          ])),
    );
  }
}
