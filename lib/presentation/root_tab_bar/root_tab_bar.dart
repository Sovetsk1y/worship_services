import 'dart:ui';

import 'package:flutter/material.dart';
import '../../utils/assets_paths.dart';

class RootTabBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final void Function(int) onPageChanged;
  final bool blurred;

  RootTabBar({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
    this.blurred = false,
  }) : super(key: key);

  static const double selectedHeight = 48;
  static const double unselectedHeight = 40;
  static const double blur = 30;
  static const double preferredHeight = 100;

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  double _sideSize(int index) =>
      index == currentPage ? selectedHeight : unselectedHeight;

  final iconPaths = [userIcon, scheduleIcon, songLibIcon];

  @override
  Widget build(BuildContext context) {
    if (!blurred) return _buildContent();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: _buildContent(),
      ),
    );
  }

  SizedBox _buildContent() {
    return SizedBox(
      height: preferredHeight,
      child: Center(
        child: Container(
          height: selectedHeight,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  3,
                  (index) => GestureDetector(
                        onTap: () {
                          onPageChanged(index);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linearToEaseOut,
                          height: _sideSize(index),
                          width: _sideSize(index),
                          child: Image.asset(
                            iconPaths[index],
                            height: _sideSize(index),
                            width: _sideSize(index),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))),
        ),
      ),
    );
  }
}
