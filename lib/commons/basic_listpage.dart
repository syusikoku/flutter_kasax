import 'package:flutter/material.dart';

import 'common_entrys.dart';
import 'commons.dart';

/// 基础的数据加载widget
abstract class AbsLoadingListWidget extends StatefulWidget {
  const AbsLoadingListWidget({Key? key}) : super(key: key);

  List<PageInfo> loadData();

  @override
  _AbsLoadingListWidgetState createState() =>
      _AbsLoadingListWidgetState(() => loadData());
}

/// 基础实现
class BasicLoadingListWidget extends AbsLoadingListWidget {
  List<PageInfo> list;

  BasicLoadingListWidget(this.list);

  @override
  List<PageInfo> loadData() {
    return list;
  }
}

class _AbsLoadingListWidgetState extends State<AbsLoadingListWidget> {
  List<PageInfo> pages = [];

  List<PageInfo> Function() loadRemoteData;

  _AbsLoadingListWidgetState(this.loadRemoteData);

  @override
  void initState() {
    super.initState();
    loadData().then((value) {
      setState(() {
        pages.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pages.isEmpty ? buildLoadingWidget() : buildCommonListView(pages),
    );
  }

  /// 加载数据
  Future<List<PageInfo>> loadData() async {
    await Future.delayed(Duration(milliseconds: 450));
    // 调用方法
    var list = loadRemoteData.call();
    return list;
  }
}
