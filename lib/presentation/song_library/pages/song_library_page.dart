import 'package:flutter/material.dart';
import 'package:worhip_service/presentation/core/big_title_container.dart';
import 'package:worhip_service/presentation/root_tab_bar/root_tab_bar.dart';
import 'package:worhip_service/utils/colors.dart';

class SongLibraryPage extends StatelessWidget {
  const SongLibraryPage({Key? key}) : super(key: key);

  static const backgroundColor = pink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: RootTabBar.preferredHeight,
          color: backgroundColor,
        ),
        BigTitleContainer(
          color: backgroundColor,
          firstLineText: 'библиотека',
          secondLineText: 'песен',
        )
      ],
    );
  }
}
