import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 最新
class NewestTab extends StatefulWidget {
  @override
  State createState() => NewestTabState();
}

class NewestTabState extends State<NewestTab> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        restorationId: 'list view',
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (int index = 1; index < 21; index++)
            ListTile(
              leading: ExcludeSemantics(
                child: CircleAvatar(child: Text('$index')),
              ),
              title: Text("$index"),
              subtitle: Text("sub title"),
            ),
        ],
      ),
    );
  }
}
