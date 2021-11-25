import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:worhip_service/presentation/my_profile/pages/my_profile_page.dart';
import 'package:worhip_service/presentation/my_schedule/pages/my_schedule_page.dart';
import 'package:worhip_service/presentation/root_tab_bar/root_tab_bar.dart';
import 'package:worhip_service/presentation/song_library/pages/song_library_page.dart';

class RootTabBarPage extends StatefulWidget {
  const RootTabBarPage({Key? key}) : super(key: key);

  @override
  State<RootTabBarPage> createState() => _RootTabBarPageState();
}

class _RootTabBarPageState extends State<RootTabBarPage>
    with SingleTickerProviderStateMixin {
  late final List<Widget> pages;

  final _songLibraryScrollController = ScrollController();
  double _songLibraryOffset = 0;

  int _currentPage = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();

    _initFields();
    _initListeners();
  }

  void _initFields() {
    pages = [
      MyProfilePage(),
      MySchedulePage(),
      SongLibraryPage(scrollController: _songLibraryScrollController),
    ];
  }

  void _initListeners() {
    _songLibraryScrollController.addListener(() {
      setState(() {
        _songLibraryOffset = _songLibraryScrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _songLibraryOffset = 0;
              });
            },
            itemBuilder: (context, index) => pages[index],
          ),
          RootTabBar(
            currentPage: _currentPage,
            blurred: _currentPage == 0,
            currentOffset: _songLibraryOffset,
            onPageChanged: (page) {
              _pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 200),
                curve: Curves.linearToEaseOut,
              );
              setState(() {
                _currentPage = page;
                _songLibraryOffset = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}
