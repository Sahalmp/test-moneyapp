import 'package:flutter/material.dart';

const Color primary = Colors.blue;
const String image =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCUirSwaddrL3rct7Rwslp2v5PHAQmJ7h8C0kN-mZKSgl0Irc';
const Color secondary = Color(0xffEFF0F4);

//Theme
ThemeData paymentthemeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white))),
);
final currentime =
    '''${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year.toString()}  ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}''';

enum Menu { credit, debit, all }
