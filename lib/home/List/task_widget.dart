import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/tasks.dart';
import 'change_content.dart';
class TaskWidgetItem extends StatelessWidget {

  Tasks tasks;
  TaskWidgetItem({required this.tasks});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
    motion: const ScrollMotion(),

    children: [
    SlidableAction(
      borderRadius: BorderRadius.only(topLeft:Radius.circular(15) ,bottomLeft:Radius.circular(15) ),
    onPressed: (context){
      //delete container
    },
    backgroundColor: MyTheme.redColor,
    foregroundColor: Colors.white,
    icon: Icons.delete,
    label: AppLocalizations.of(context)!.delete,
    ),
    ],
    ),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: provider.appTheme==ThemeMode.dark?
              MyTheme.blackColorDark:
              MyTheme.whiteColor
            ,
          borderRadius: BorderRadius.circular(20)
        ),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(ChangeContent.routeName,arguments: ContentArgs(tasks: tasks) );
          },
          child: Row(
             children: [
               Container(
                 margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
                 color: MyTheme.primaryColor,
                 height: MediaQuery.of(context).size.height*0.1,
                 width: MediaQuery.of(context).size.width*0.01,
               ),
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(tasks?.title?? "",style:Theme.of(context).textTheme.titleSmall,),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text(tasks?.description?? ""),
                   )
                 ],
               ),
               Spacer(),
               Container(
                 margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
                 height: MediaQuery.of(context).size.height*0.05,
                 width: MediaQuery.of(context).size.width*0.2,
                 decoration: BoxDecoration(
                     color: MyTheme.primaryColor,
                     borderRadius: BorderRadius.circular(15)
                 ),
                 child: Icon(Icons.check,color: MyTheme.whiteColor,size: 30,),
               ),
             ],
          ),
        ),
      ),
    );
  }
}
