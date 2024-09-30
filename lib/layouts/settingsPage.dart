import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <ThemeProvider>(
      builder:(context, value, child) {
        return  Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade400, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      value.isDark ? "Light Mode" : "Dark Mode",
                    ),
                    Spacer(),
                    Switch(
                      value: value.isDark,
                      onChanged: (_value) {
                        value.toggleTheme();
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


