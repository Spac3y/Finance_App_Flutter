import 'package:finacash/Widgets/AnimatedBottomNavBar.dart';
import 'package:finacash/screen/ExpensesSummary.dart';
import 'package:finacash/screen/HomePage.dart';
import 'package:finacash/screen/ReveneuSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:finacash/global.dart" as globals;

final List<String> wordList = ['Expenses', 'Cheltuieli'];
final List<String> word1List = ['Home', 'Acasa'];
final List<String> word2List = ['Reveneu', 'Venituri'];

class InitialPage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: wordList[globals.languageNumber],
      iconData: Icons.remove_circle_outline,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: word1List[globals.languageNumber],
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: word2List[globals.languageNumber],
      iconData: Icons.add_circle_outline,
      color: Colors.teal,
    ),
    // BarItem(
    //   text: "Search",
    //   iconData: Icons.search,
    // color: Colors.yellow.shade900,
    // ),
  ];

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
        //statusBarColor: Colors.lightBlue[700],
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light // status bar color
        ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    List<Widget> screens = [ExpensesSummary(), HomePage(), ReveneuSummary()];

    //_allMov();
    //print("\nMes atual: " + DateTime.now().month.toString());
    return Scaffold(
      body: screens[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 150),
        barStyle: BarStyle(fontSize: width * 0.045, iconSize: width * 0.07),
        onBarTap: (index) {
          setState(() {
            selectedBarIndex = index;
          });
        },
      ),
    );
  }
}
