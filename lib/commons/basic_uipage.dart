import 'package:flutter/material.dart';
import 'package:kasax/commons/baic_placeholder.dart';

import 'common_entrys.dart';

/// 基础的界面:仅有appbar,不支持其它控件
class BasicUIPage extends StatelessWidget {
  final PageInfo _pageInfo;
  final bool showAppbar;

  // 展示模式:水平和垂直
  final bool isActionGroupRowStyle;
  final List<FloatingActionButton>? actionButtons;

  const BasicUIPage(this._pageInfo,
      {Key? key, this.showAppbar = true, this.actionButtons, this.isActionGroupRowStyle = false})
      : super(key: key);

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
      floatingActionButton: Container(
        child: isActionGroupRowStyle ? buildRowActionbars() : buildColumnActionbars(),
      ),
    );
  }

  buildNormalScaffold() {
    return Scaffold(
      body: _pageInfo.routePage,
    );
  }

  isEmptyActionGruoup() => actionButtons == null || actionButtons!.isEmpty;

  buildRowActionbars() {
    return isEmptyActionGruoup()
        ? PlaceHolderUI()
        : Row(
            children: actionButtons!.toList(),
          );
  }

  buildColumnActionbars() {
    return isEmptyActionGruoup()
        ? PlaceHolderUI()
        : Column(
            children: actionButtons!.toList(),
          );
  }
}
