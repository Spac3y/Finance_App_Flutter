import 'package:finacash/global.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var height;
  var width;

  Color backgroundColor = Color(0xf18181);
  Color menuColor = Color(0xff212121);
  Color hoverColor = Color(0xff3D3D3D);
  Color primaryTextColor = Color(0xffFFFFFF);
  Color secondaryTextColor = Color(0xffAAAAAA);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:
            (globals.darkMode) ? Color.fromARGB(255, 37, 37, 37) : Colors.white,
        child: SingleChildScrollView(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            color: (globals.darkMode) ? backgroundColor : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: height * 0.10, //300,
                    color: (globals.darkMode)
                        ? Color.fromARGB(255, 37, 37, 37)
                        : Colors.white,
                  ),
                  Container(
                    color: (globals.darkMode)
                        ? Color.fromARGB(255, 37, 37, 37)
                        : Colors.white,
                    child: Row(
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [Colors.lightBlue, Colors.blue],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Icon(
                            Icons.settings_outlined,
                            size: height * 0.05,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 22, 22, 204)
                          ]).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: height * 0.05,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Container(
                    width: width * 1,
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.75,
                            child: Text(
                              "Theme",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: (globals.darkMode)
                                    ? Colors.white
                                    : Color.fromARGB(255, 37, 37, 37),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.75,
                            // child: Icon(Icons.arrow_right),
                            child: FlutterSwitch(
                              width: 55,
                              activeIcon: Icon(Icons.dark_mode),
                              activeColor: Color.fromARGB(255, 54, 54, 54),
                              inactiveIcon: Icon(Icons.light_mode),
                              inactiveColor: Colors.grey,
                              onToggle: (value) =>
                                  setState(() => globals.darkMode = value),
                              value: globals.darkMode,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: (globals.darkMode)
                        ? secondaryTextColor
                        : Colors.grey[400],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        globals.languageNumber =
                            (globals.languageNumber + 1) % 2;
                      });
                    },
                    child: Container(
                      width: width * 1,
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Opacity(
                              opacity: 0.75,
                              child: Text(
                                "Language",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: (globals.darkMode)
                                      ? Colors.white
                                      : Color.fromARGB(255, 37, 37, 37),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Opacity(
                              opacity: 0.75,
                              child: Icon(
                                Icons.arrow_right,
                                color: (globals.darkMode)
                                    ? Colors.white
                                    : Color.fromARGB(255, 37, 37, 37),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: (globals.darkMode)
                        ? secondaryTextColor
                        : Colors.grey[400],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        globals.currencyNumber =
                            (globals.currencyNumber + 1) % 2;
                      });
                    },
                    child: Container(
                      width: width * 1,
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Opacity(
                              opacity: 0.75,
                              child: Text(
                                "Currency",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: (globals.darkMode)
                                      ? Colors.white
                                      : Color.fromARGB(255, 37, 37, 37),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Opacity(
                              opacity: 0.75,
                              child: Icon(
                                Icons.arrow_right,
                                color: (globals.darkMode)
                                    ? Colors.white
                                    : Color.fromARGB(255, 37, 37, 37),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.save,
        ),
      ),
    );
  }
}
