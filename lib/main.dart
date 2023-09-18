import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'home/home_page.dart';
import 'my_theme.dart';
import 'package:provider/provider.dart';

void main(){
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
      initialRoute:HomePage.routeName ,
      routes:{
        HomePage.routeName:(context)=>HomePage(),
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