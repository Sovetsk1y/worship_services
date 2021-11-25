import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worhip_service/application/song_library_cubit/cubit/song_library_cubit.dart';
import 'package:worhip_service/dependency_injector.dart';
import 'package:worhip_service/presentation/core/big_title_container.dart';
import 'package:worhip_service/presentation/core/ws_text_field.dart';
import 'package:worhip_service/presentation/root_tab_bar/root_tab_bar.dart';
import 'package:worhip_service/utils/colors.dart';
import 'package:worhip_service/utils/svg_paths.dart';
import 'package:worhip_service/utils/text_styles.dart';

class SongLibraryPage extends StatelessWidget {
  final ScrollController scrollController;

  const SongLibraryPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  static const backgroundColor = pink;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SongLibraryCubit>(
      create: (context) => getIt()..getSongs(),
      child: SingleChildScrollView(
        controller: scrollController,
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
              firstLineText: 'библиотека',
              secondLineText: 'песен',
              bottom: _buildSearchTextField(),
            ),
            BlocBuilder<SongLibraryCubit, SongLibraryState>(
                builder: (context, state) {
              return state.map(
                initial: (_) => SizedBox.shrink(),
                loading: (_) => Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(backgroundColor),
                  ),
                ),
                failed: (state) => Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.failure.map(
                    server: (_) => 'Ошибка сервера. Попробуйте позже',
                  )),
                )),
                retrieved: (state) => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.songs.length,
                    itemBuilder: (context, index) {
                      final song = state.songs.toList()[index];
                      return ListTile(
                        tileColor: index % 2 == 1 ? lightGrey1 : Colors.white,
                        title: Text(song.title, style: extraBold17),
                        trailing:
                            Icon(Icons.chevron_right, color: Colors.black),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: WsTextField(
        placeholder: 'Ищу песню...',
        suffix: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(searchIcon),
        ),
      ),
    );
  }
}
