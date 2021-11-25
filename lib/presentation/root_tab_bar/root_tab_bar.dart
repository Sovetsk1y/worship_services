import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worhip_service/utils/svg_paths.dart';

class RootTabBar extends StatelessWidget implements PreferredSizeWidget {
  final double currentOffset;
  final int currentPage;
  final void Function(int) onPageChanged;
  final bool blurred;
  final Color backgroundColor;

  RootTabBar({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
    required this.currentOffset,
    this.blurred = false,
    this.backgroundColor = Colors.transparent,
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

  double get _scale {
    const min = 0;
    const max = 100;

    double substractor = 1;
    if (currentOffset >= min && currentOffset <= max) {
      substractor = currentOffset / max;
    }
    return 1 - substractor;
  }

  Offset _offset(int index) {
    switch (index) {
      case 0:
        return Offset(-currentOffset / 3, -currentOffset / 3);
      case 1:
        return Offset(0, -currentOffset / 3);
      case 2:
        return Offset(currentOffset / 3, -currentOffset / 3);
      default:
        return Offset.zero;
    }
  }

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

  Widget _buildContent() {
    return SafeArea(
      child: Container(
        height: preferredHeight,
        color: backgroundColor,
        child: SizedBox(
          height: selectedHeight,
          child: Center(
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
                            child: IgnorePointer(
                              ignoring: _scale < 0.5 || index == currentPage,
                              child: Opacity(
                                opacity: _scale,
                                child: Transform.translate(
                                  offset: _offset(index),
                                  child: Transform.scale(
                                    scale: _scale,
                                    child: SvgPicture.asset(
                                      iconPaths[index],
                                      height: _sideSize(index),
                                      width: _sideSize(index),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))),
          ),
        ),
      ),
    );
  }
}
