import 'package:flutter/material.dart';
import 'package:kasax/utils/route_utils.dart';

import 'basic_uipage.dart';
import 'common_entrys.dart';
import 'common_test_datas.dart';

/// 构建基础UI界面
Widget buildBasicUIPage(Widget widget, String title) {
  return BasicUIPage(PageInfo(widget, title: title));
}

/// 构建基础通用的ListView
Widget buildCommonListView(List<PageInfo> list) {
  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var pageInfo = list[index];
        return ListTile(
          title: Text(
            "${pageInfo.title}",
            textAlign: TextAlign.center, // 文本居中
          ),
          onTap: () {
            RouteUtils.push(context, pageInfo.routePage);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: list.length);
}

/// 构建示例颜色列表
buildSampleColorList() {
  List<Widget> widgets = [];
  widgets.add(Container(
    color: Colors.primaries[0],
    margin: EdgeInsets.only(top: 10),
    width: 440,
  ));

  widgets.add(Container(
    color: Colors.primaries[1],
    margin: EdgeInsets.only(left: 20, top: 10),
    width: 540,
  ));
  return widgets;
}

/// 构建基础的图片列表
buildSampleImgList() {
  List<String> imgUrls = TestDatas.TEST_IO_IMS;
  List<Widget> widgets = <Widget>[];
  for (var value in imgUrls) {
    widgets.add(Container(
      margin: EdgeInsets.only(left: 10),
      child: Image.network(value),
    ));
  }
  return widgets;
}

/// 构建loading加载控件
buildLoadingWidget() {
  return Center(
    child: Opacity(
      opacity: 0.4, //　指定透明度
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.withOpacity(.4)), // 为颜色指定透明度
        height: 80,
        width: 80,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ),
  );
}

/// 构建基础的loading
buildBasicLoadingWidget() {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: CircularProgressIndicator(),
    ),
  );
}

/// 构建横向全屏的按钮
buildCommonRaisedButton(title, marginSize, callback) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(marginSize),
    child: RaisedButton(
      onPressed: callback,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          "$title",
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
