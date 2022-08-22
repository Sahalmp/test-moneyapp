import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:moneyapp/model/api/usermodel.dart';

class GetUsers {
  static Users? user_model;

  static Future<Data>? getApi(int index) async {
    try {
      http.Response response = await http.get(
        Uri.tryParse('https://reqres.in/api/users/$index')!,
      );
      if (response.statusCode == 200) {
        ///data successfully

        var result = jsonDecode(response.body);

        user_model = Users.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      print('Error while getting data is $e');
      return user_model!.data;
    } finally {}
    return user_model!.data;
  }
}
