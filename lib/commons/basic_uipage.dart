import 'package:flutter/material.dart';

import 'common_entrys.dart';

/// 基础的界面:仅有appbar,不支持其它控件
class BasicUIPage extends StatelessWidget {
  final PageInfo _pageInfo;
  final bool showAppbar;

  const BasicUIPage(this._pageInfo, {Key? key, this.showAppbar = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAppbar ? buildAppbarScaffold() : buildNormalScaffold();
  }

  buildAppbarScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageInfo.title),
        centerTitle: true,
      ),
      body: _pageInfo.routePage,
    );
  }

  buildNormalScaffold() {
    return Scaffold(
      body: _pageInfo.routePage,
    );
  }
}
