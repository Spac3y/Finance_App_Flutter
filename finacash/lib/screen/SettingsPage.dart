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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.13, //300,
                  color: Colors.white,
                ),
                Container(
                  color: Colors.white,
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
                        shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.blue, Color(0xFF0000B9)])
                            .createShader(
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
                GestureDetector(
                  onTap: () {
                    print('1');
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
                              "Theme",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
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
                              activeColor: Colors.black,
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
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print('1');
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
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.75,
                            child: Icon(Icons.arrow_right),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print('1');
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
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.75,
                            child: Icon(Icons.arrow_right),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.save),
      ),
    );
  }
}
