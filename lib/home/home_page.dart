
import 'package:flutter/material.dart';
import 'package:todo_app/home/List/add_bottom_sheet.dart';
import 'package:todo_app/home/List/list_tab.dart';
import 'package:todo_app/home/settings/settings_tab.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(


      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: MyTheme.whiteColor
          ),
        ),
      ),
      bottomNavigationBar:
      BottomAppBar(
        shape:CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.list,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddBottomSheet();
          },
          child: Icon(Icons.add),
         ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }


  List<Widget>tabs=[ListTab(),SettingsTab()];

  void showAddBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>AddBottomSheet());
  }
}
