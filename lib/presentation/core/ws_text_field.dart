import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worhip_service/utils/colors.dart';
import 'package:worhip_service/utils/text_styles.dart';

class WsTextField extends StatelessWidget {
  final String? placeholder;
  final Widget? suffix;

  const WsTextField({
    Key? key,
    this.placeholder,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      placeholder: placeholder,
      placeholderStyle: textFieldPlaceholder,
      style: textFieldPlaceholder,
      suffix: suffix,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: black2),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
