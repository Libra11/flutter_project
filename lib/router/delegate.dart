/*
 * @Author: Libra
 * @Date: 2021-11-22 11:08:05
 * @LastEditTime: 2021-11-22 13:24:58
 * @LastEditors: Libra
 * @Description: 自定义路由委托
 * @FilePath: /test_flutter/lib/router/delegate.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/pages/base_page.dart';
import 'package:test_flutter/pages/login_page.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;
    switch (routeSettings.name) {
      case '/base':
        child = const BasePage();
        break;
      case '/login':
        child = const LoginPage();
        break;
      default:
        child = const Scaffold();
    }

    return MaterialPage(
      child: child,
      key: Key(routeSettings.name!) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }

  /// 压入新页面显示
  void push({required String name, dynamic arguments}) {
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
