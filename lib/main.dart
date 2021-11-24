import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chord/flutter_chord.dart';
import 'package:worhip_service/presentation/root_tab_bar/root_tab_bar_page.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: RootTabBarPage(),
    );
  }
}

class ChordsPage extends StatefulWidget {
  ChordsPage({Key? key}) : super(key: key);

  @override
  _ChordsPageState createState() => _ChordsPageState();
}

class _ChordsPageState extends State<ChordsPage> {
  final textStyle = TextStyle(fontSize: 18, color: Colors.black);
  final chordStyle = TextStyle(fontSize: 20, color: Colors.green);

  final lyrics = '''
  [Dm ][F ][C/E]Аллилуйя, [Gm ][Dm ]Ты победу[C] одержал!
''';

  @override
  Widget build(BuildContext context) {
    return LyricsRenderer(
      lyrics: lyrics,
      textStyle: textStyle,
      chordStyle: chordStyle,
      onTapChord: (String chord) {
        print('pressed chord: $chord');
      },
    );
  }
}
