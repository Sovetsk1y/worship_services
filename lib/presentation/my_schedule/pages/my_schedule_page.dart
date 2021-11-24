import 'package:flutter/material.dart';
import 'package:worhip_service/presentation/core/big_title_container.dart';
import 'package:worhip_service/presentation/root_tab_bar/root_tab_bar.dart';
import 'package:worhip_service/utils/colors.dart';
import 'package:worhip_service/utils/assets_paths.dart';
import 'package:worhip_service/utils/text_styles.dart';

class MySchedulePage extends StatelessWidget {
  const MySchedulePage({Key? key}) : super(key: key);

  static const backgroundColor = orange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: RootTabBar.preferredHeight,
            decoration: BoxDecoration(color: backgroundColor, boxShadow: [
              BoxShadow(color: backgroundColor, offset: Offset(0, 1))
            ]),
          ),
          BigTitleContainer(
            color: backgroundColor,
            firstLineText: 'моё',
            secondLineText: 'расписание',
          ),
          Image.asset(emptyListMan),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Похоже, у тебя нет планов\nна ближайшее время.',
              style: emptyListStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
