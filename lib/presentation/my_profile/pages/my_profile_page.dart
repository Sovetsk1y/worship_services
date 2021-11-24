import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worhip_service/utils/svg_paths.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            man1,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
