import 'package:flutter/material.dart';

/// 通用页面封装
class PageInfo {
  // 标题
  String title;

  // 路由界面
  Widget routePage;

  // 默认构造参数
  PageInfo(this.routePage, {this.title = ""});
}

// 界面类型
enum PageType{
  DEFAULT, // 默认类型，为普通界面
  LIST, // 列表类型
}

