import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneyapp/model/constants.dart';
import 'package:moneyapp/model/api/usermodel.dart';
import 'package:moneyapp/view/screens/payamount.dart';
import 'package:moneyapp/view_model/transactioncontroller.dart';
import 'package:shimmer/shimmer.dart';

import '../../Model/dbmodel/transactionmodel.dart';
import '../../model/api/services/services.dart';
import '../widgets/searchTextFieldWidget.dart';
import '../widgets/transactiontile.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final TransactionalController controller = Get.put(TransactionalController());
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: const Color(0xffEFF0F4),
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
            )
          ],
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(image),
                  radius: 17,
                ),
              ),
            ),
            background: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Hi Vanessa',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Here's is your spending dashboard ",
                                  style: TextStyle(height: 1.5),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              height: 270,
              color: const Color(0xffEFF0F4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          height: 100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(Container(
                                        height: size.height * 0.30,
                                        child: AddMoneyWidget(),
                                      ));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GetBuilder<TransactionalController>(
                                            init: TransactionalController(),
                                            builder: (_) {
                                              return Text(
                                                '\$ ${_.amount}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textScaleFactor: 2,
                                              );
                                            }),
                                        const Text('Your Balance')
                                      ],
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            '30',
                                            style: TextStyle(
                                                color: primary,
                                                fontWeight: FontWeight.bold),
                                            textScaleFactor: 2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 12.0),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Text('Last Days')
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Send Again',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return FutureBuilder<Data>(
                                future: GetUsers.getApi(index + 1),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Shimmer.fromColors(
                                        highlightColor: Colors.white,
                                        baseColor: secondary,
                                        child: const CircleAvatar(
                                          radius: 30,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 26,
                                          ),
                                        ));
                                  }
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => PayAmountScreen(
                                                  name:
                                                      "${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                                                  avatar: snapshot.data!.avatar,
                                                ));
                                          },
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: NetworkImage(
                                                        '${snapshot.data?.avatar}'),
                                                    radius: 26,
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${snapshot.data?.firstName}\n${snapshot.data?.lastName}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    height: 1,
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SearchFieldWidget(
                  placeholder: 'Search Transactions',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Your Activity',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    PopupMenuButton<Menu>(
                        icon: const Icon(
                          Icons.sort,
                          color: primary,
                        ),
                        // Callback that sets the selected popup menu item.
                        onSelected: (Menu item) {
                          _selectedMenu = item.name;
                          controller.selectmenu(_selectedMenu);
                          print(_selectedMenu);
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<Menu>>[
                              const PopupMenuItem<Menu>(
                                value: Menu.all,
                                child: Text('All'),
                              ),
                              PopupMenuItem<Menu>(
                                onTap: () {},
                                value: Menu.credit,
                                child: const Text('Credit'),
                              ),
                              const PopupMenuItem<Menu>(
                                value: Menu.debit,
                                child: Text('Debit'),
                              ),
                            ])
                  ],
                )
              ],
            ),
          ),
        ),
        GetBuilder<TransactionalController>(
            init: TransactionalController(),
            builder: (transactionalController) {
              if (transactionalController.tdata.isEmpty) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text('No transactions'),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    List transactionlist;

                    TransactionModel transactions =
                        transactionalController.tdata[index];

                    return TransactionsSection(transactions: transactions);
                  },
                  childCount: transactionalController.tdata.length,
                ),
              );
            }),
      ],
    );
  }
}

class AddMoneyWidget extends StatelessWidget {
  const AddMoneyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionalController controller =
        Get.find<TransactionalController>();
    final TextEditingController amountcontroller = TextEditingController();
    return BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        onClosing: () {},
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14))),
                width: double.infinity,
                height: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Add Money',
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ).paddingAll(10),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Enter Amount",
                  fillColor: secondary,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ).paddingSymmetric(horizontal: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                            onPressed: () {
                              final TransactionModel transactiondata =
                                  TransactionModel(
                                      key:
                                          DateTime.now().millisecondsSinceEpoch,
                                      name: 'added to balance',
                                      type: 'credited',
                                      date: currentime,
                                      amount: amountcontroller.text);
                              controller.addtransactions(transactiondata);
                              controller.addtobalance(
                                  int.parse(amountcontroller.text));

                              Get.back();
                            },
                            child: const Text('Add Money'))
                        .paddingAll(20),
                  ),
                ],
              )
            ],
          );
        });
  }
}
