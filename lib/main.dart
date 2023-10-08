import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/auth/login/login.dart';
import 'package:todo_app/auth/register/register.dart';
import 'package:todo_app/home/List/change_content.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'home/home_page.dart';
import 'my_theme.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
    create: (context) =>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RegisterScreen.routeName ,
      routes:{
        HomePage.routeName:(context)=>HomePage(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        ChangeContent.routeName:(context)=>ChangeContent(),
      } ,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(provider.appLanguage) ,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode:provider.appTheme ,
      // darkTheme: MyTheme.darkMode,
    );
  }

}