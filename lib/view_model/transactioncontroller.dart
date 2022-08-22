import 'package:get/get.dart';
import 'package:moneyapp/Model/dbmodel/transactionmodel.dart';
import 'package:moneyapp/main.dart';

class TransactionalController extends GetxController {
  List<TransactionModel> tdata = [];
  int amount = 0;
  String selecteditem = 'all';
  @override
  void onInit() {
    getalldata();
    getamount();
    // TODO: implement onInit
    super.onInit();
  }

  void selectmenu(item) {
    getalldata();

    if (item == 'credit') {
      tdata = tdata.where((element) => element.type == 'credited').toList();
    } else if (item == 'debit') {
      tdata = tdata.where((element) => element.type == 'paid to').toList();
    } else {
      getalldata();
    }
    selecteditem = item;
    update();
  }

  void addtransactions(TransactionModel data) async {
    await transactionBox.add(data);
    getalldata();
    update();
  }

  getalldata() {
    tdata = transactionBox.values.toList();
    tdata.sort((b, a) => a.key.compareTo(b.key));
    update();
  }

  addtobalance(int addamount) async {
    await getamount();
    if (balanceBox.isEmpty) {
      await balanceBox.add(amount + addamount);
    } else {
      await balanceBox.putAt(0, amount + addamount);
    }
    await getamount();
    update();
    print(balanceBox.values.first);
  }

  subfrombalance(int subamount) async {
    await balanceBox.putAt(0, amount - subamount);
    getamount();
    update();
  }

  getamount() {
    if (balanceBox.isNotEmpty) {
      amount = balanceBox.values.first;
      update();
    }
  }
}
