import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hacgapp/tab/AnimationTab.dart';
import 'package:hacgapp/tab/GameTab.dart';
import 'package:hacgapp/tab/NewestTab.dart';
import 'package:hacgapp/tab/OtherTab.dart';
import 'package:hacgapp/tab/ThreeDimensionTab.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {
  ///
  TabController _tabController;

  ///
  final RestorableInt _tabIndex = RestorableInt(0);

  ///
  List<String> _tabs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
    _tabController.addListener(() {
      // When the tab controller's value is updated, make sure to update the
      // tab index value, which is state restorable.
      setState(() {
        _tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabs = [
      AppLocalizations.of(context).newest,
      AppLocalizations.of(context).animation,
      AppLocalizations.of(context).threeDimension,
      AppLocalizations.of(context).game,
      AppLocalizations.of(context).other
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(
        children: [
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _getTabBars(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _getTabViews(),
            ),
          ),
        ],
      ),
    );
  }

  ///
  List<Widget> _getTabBars() {
    List<Widget> _tabBars = [];
    for (final tab in _tabs) {
      _tabBars.add(Tab(text: tab));
    }
    return _tabBars;
  }

  ///
  List<Widget> _getTabViews() {
    List<Widget> _tabViews = [];
    _tabViews.add(NewestTab());
    _tabViews.add(AnimationTab());
    _tabViews.add(ThreeDimensionTab());
    _tabViews.add(GameTab());
    _tabViews.add(OtherTab());
    return _tabViews;
  }

  ///
  @override
  String get restorationId => "Home Page";

  ///
  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_tabIndex, 'tabIndex');
  }

  ///
  @override
  void dispose() {
    _tabController.dispose();
    _tabIndex.dispose();
    super.dispose();
  }
}
