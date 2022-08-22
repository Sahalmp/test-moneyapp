
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/constants.dart';
import '../../search.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    required this.placeholder,
    Key? key,
  }) : super(key: key);
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      readOnly: true,
      onTap: (() {
        showSearch(context: context, delegate: Mysearch());
      }),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
      prefix: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          CupertinoIcons.search,
          color: primary,
        ),
      ),
      placeholder: placeholder,
    );
  }
}
