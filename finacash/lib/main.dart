import 'package:MondayReport/screen/InitialPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
