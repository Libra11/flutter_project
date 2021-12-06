/*
 * @Author: Libra
 * @Date: 2021-11-22 11:08:05
 * @LastEditTime: 2021-12-06 19:09:06
 * @LastEditors: Libra
 * @Description: 自定义路由委托
 * @FilePath: /test_flutter/lib/router/delegate.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/pages/basic_page.dart';
import 'package:test_flutter/pages/camera_page.dart';
import 'package:test_flutter/pages/login_page.dart';
import 'package:test_flutter/pages/notice_page.dart';
import 'package:test_flutter/pages/select_page.dart';
import 'package:test_flutter/pages/test_page.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<Page<dynamic>> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;
    switch (routeSettings.name) {
      case '/basic':
        child = const BasicPage();
        break;
      case '/login':
        child = const LoginPage();
        break;
      case '/test':
        child = const TestPage();
        break;
      case '/select':
        child = const SelectPage();
        break;
      case '/camera':
        child = const CameraPage();
        break;
      case '/notice':
        child = const NoticePage();
        break;
      default:
        child = const Scaffold();
    }
    return MaterialPage(
      child: child,
      key: Key(routeSettings.name ?? '') as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }

  /// 压入新页面显示
  void push({required String name, dynamic arguments}) {
    // 判断当前 _pages 是否已经存在该页面, 如果存在，将页面移动到数组最后一位
    if (_pages.any((page) => page.name == name)) {
      _pages.removeWhere((page) => page.name == name);
      // return;
    }
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    // 通知路由栈，我们的Page列表已经修改了
    notifyListeners();
  }

  /// 替换当前正在显示的页面
  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  bool canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;

    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }
}
