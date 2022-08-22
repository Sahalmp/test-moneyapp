import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Model/dbmodel/transactionmodel.dart';
import 'view/screens/homescreen.dart';

late Box<TransactionModel> transactionBox;
late Box<int> balanceBox;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  transactionBox = await Hive.openBox<TransactionModel>("transactions");
  balanceBox=await Hive.openBox<int>("balance");

  runApp(const MoneyApp());
}

class MoneyApp extends StatelessWidget {
  const MoneyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      title: 'MoneyApp',
      home: const HomeScreen(),
    );
  }
}
