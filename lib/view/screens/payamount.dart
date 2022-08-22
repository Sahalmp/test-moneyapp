import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneyapp/model/constants.dart';
import 'package:moneyapp/main.dart';
import 'package:moneyapp/view/screens/payment.dart';

class PayAmountScreen extends StatelessWidget {
  PayAmountScreen({Key? key, required this.avatar, required this.name})
      : super(key: key);
  final String name, avatar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: primary,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: secondary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter the Amount',
                        ),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              onChanged: ((value) {
                                return value == "0" ? controller.clear() : null;
                              }),
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please enter amount'
                                    : int.parse(value) > balanceBox.values.first
                                        ? 'please add Money, Not enough balance available'
                                        : null;
                              },
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: primary))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(avatar),
                                      backgroundColor: primary,
                                      radius: 26,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      name,
                                      textScaleFactor: 1.3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    'Your balance :\$ ${balanceBox.values.first}'),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      primary)),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Get.to(() => PaymentScreen(
                                                    name: name,
                                                    avatar: avatar,
                                                    amount: controller.text,
                                                  ));
                                            }
                                          },
                                          child: const Text('Pay')),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
