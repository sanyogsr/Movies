import 'package:flutter/material.dart';
import 'package:movies/screens/Base/base_screen.dart';
import 'package:movies/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeNotifier())
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: BaseScreen()));
  }
}
