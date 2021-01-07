import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 游戏
class GameTab extends StatefulWidget {
  @override
  State createState() => GameTabState();
}

class GameTabState extends State<GameTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("game"));
  }
}
