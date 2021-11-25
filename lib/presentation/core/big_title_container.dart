import 'package:flutter/material.dart';
import 'package:worhip_service/utils/text_styles.dart';

class BigTitleContainer extends StatelessWidget {
  final Color color;
  final String firstLineText;
  final String secondLineText;
  final Widget bottom;
  const BigTitleContainer({
    Key? key,
    required this.color,
    required this.firstLineText,
    required this.secondLineText,
    this.bottom = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(firstLineText, style: bigTitleStroked),
          Text(secondLineText, style: bigTitle),
          bottom,
        ],
      ),
    );
  }
}
