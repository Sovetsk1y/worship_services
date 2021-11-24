import 'package:flutter/material.dart';
import 'package:worhip_service/utils/assets_paths.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            man1Big,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
