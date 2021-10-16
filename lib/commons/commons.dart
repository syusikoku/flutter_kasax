import 'package:flutter/material.dart';
import 'package:kasax/utils/log_utils.dart';
import 'package:kasax/utils/route_utils.dart';
import 'package:kasax/widgets/circle_button.dart';

import 'basic_uipage.dart';
import 'common_entrys.dart';
import 'common_test_datas.dart';

/// 构建基础UI界面
/// 构建基础UI界面
Widget buildBasicUIPage(Widget widget, String title, {bool showAppbar = true}) {
  return BasicUIPage(
    PageInfo(widget, title: title),
    showAppbar: showAppbar,
  );
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

/// 构建圆角按钮
buildCircleButton(String title, VoidCallback callback) {
  return CircleButton(
    title: title,
    callback: callback,
  );
}

/// 构建富文本
Widget buildRichText(String searchKey, String target) {
// LogUtil.e("search2: _searchStr: $searchKey , target: $target");
  var _highlightStyle = TextStyle(color: Colors.red, fontSize: 14);
  var _normalStyle = TextStyle(color: Colors.black, fontSize: 14);
  List<TextSpan> spans = [];

  if (searchKey.isEmpty) {
    spans.add(TextSpan(text: target, style: _normalStyle));
  } else {
    if (searchKey == target) {
      spans.add(TextSpan(text: target, style: _highlightStyle));
    } else {
      List<String> list = target.split(searchKey);
      LogUtil.e("list: ${list.toString()} , len =${list.length}");
      for (int i = 0; i < list.length; i++) {
        if ((i + 1) % 2 == 0) {
          spans.add(TextSpan(text: searchKey, style: _highlightStyle));
        }
        var val = list[i];
        if (val.length > 0) {
          spans.add(TextSpan(text: val, style: _normalStyle));
        }
      }
    }
  }

  return RichText(
    text: TextSpan(children: spans),
  );
}
