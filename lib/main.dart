import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/cubit/todo_cubit.dart';
import 'package:todo_list_app/layouts/settingsPage.dart';
import 'package:todo_list_app/themes/app_theme.dart';
import 'package:todo_list_app/themes/theme_provider.dart';

import 'data/models/todo_model.dart';
import 'layouts/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  final myBox = await Hive.openBox<TodoModel>("todoBox");
  runApp(MyApp(todoBox: myBox));
}

class MyApp extends StatelessWidget {
  final Box<TodoModel> todoBox;

  MyApp({required this.todoBox});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        BlocProvider(create: (context) => TodoCubit(todoBox)),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: HomePage(),
            theme: Provider.of<ThemeProvider>(context).currentTheme,
            themeMode: ThemeMode.dark,
            routes: {
              "/SettingScreen": (context) => Settingspage(),
            },
          );
        },
      ),
    );
  }
}