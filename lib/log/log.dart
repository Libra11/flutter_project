/*
 * @Author: Libra
 * @Date: 2021-11-17 15:17:35
 * @LastEditTime: 2021-11-17 16:11:18
 * @LastEditors: Libra
 * @Description: 封装 打印函数
 * @FilePath: /test_flutter/lib/log/log.dart
 */
import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    output: null,
    printer: PrettyPrinter(
      colors: false, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    ),
  );

  static void v(dynamic message) {
    _logger.v(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }

  static void wtf(dynamic message) {
    _logger.wtf(message);
  }
}
