import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

int languageNumber = 0;
bool darkMode = false;
int currencyNumber = 1;

void readGlobal() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/global.json');
  if (!await file.exists()) {
    return null;
  } else {
    String data = await file.readAsString();
    final jsonResult = jsonDecode(data);
    if (jsonResult == null) {
      return null;
    }
    jsonResult['languageNumber'] = languageNumber;
    jsonResult['darkMode'] = darkMode;
    jsonResult['currencyNumber'] = currencyNumber;
  }
}

void saveGlobal() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/global.json');
  var dict = {
    'languageNumber': languageNumber,
    'darkMode': darkMode,
    'currencyNumber': currencyNumber
  };
  file.writeAsString(jsonEncode(dict));
}
