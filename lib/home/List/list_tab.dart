import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/List/add_bottom_sheet.dart';
import 'package:todo_app/home/List/list_tab.dart';
import 'package:todo_app/home/List/task_widget.dart';
import 'package:todo_app/home/settings/settings_tab.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor:MyTheme.primaryColor,
          dotsColor: MyTheme.whiteColor,
          locale:provider.appLanguage ,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (_,__){
               return TaskWidgetItem();
              }
          ),
        )
      ],
    );
  }
}
