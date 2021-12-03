/*
 * @Author: Libra
 * @Date: 2021-11-15 14:00:13
 * @LastEditTime: 2021-12-03 13:45:10
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/main.dart
 */
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:test_flutter/http/dao/login_dao.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/provider/job_info.dart';
import 'package:test_flutter/router/delegate.dart';

MyRouterDelegate delegate = MyRouterDelegate();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> get jwtOrEmpty async {
    var jwt = await LoginDao.getToken();
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CandidateInfo()),
        ChangeNotifierProvider(create: (_) => ExamInfo()),
        ChangeNotifierProvider(create: (_) => JobInfo()),
      ],
      child: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data == "") {
              delegate.push(name: '/login');
            } else {
              delegate.push(name: '/basic');
            }
            return MaterialApp(
                title: 'Flutter Demo', home: Router(routerDelegate: delegate));
          }),
    );
  }
}
