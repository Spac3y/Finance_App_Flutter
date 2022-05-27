import 'package:MondayReport/screen/InitialPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

main() {
  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
