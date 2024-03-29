import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/dialog_utils.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/auth_provider.dart';
import '../../model/tasks.dart';
import 'change_content.dart';
class TaskWidgetItem extends StatefulWidget {

  Tasks tasks;
  TaskWidgetItem({required this.tasks});

  @override
  State<TaskWidgetItem> createState() => _TaskWidgetItemState();
}

class _TaskWidgetItemState extends State<TaskWidgetItem> {
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
        var authProvider=Provider.of<AuthProvider>(context,listen: false);
      //delete container
      FirebaseUtils.deleteTaskFromFireStore(widget.tasks, authProvider.currentUser?.id??"").then((value) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, "Task added Successfully",posActionName: "ok",posAction: (){
          Navigator.pop(context);
        });
      }).timeout(
        Duration(milliseconds: 500),
        onTimeout: (){
          provider.getAllTasksFromFireStore(authProvider.currentUser?.id??"");
          Navigator.pop(context);

        }
      );
    },
    backgroundColor: MyTheme.redColor,
    foregroundColor: Colors.white,
    icon: Icons.delete,
    label: AppLocalizations.of(context)!.delete,
    ),
    ],
    ),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: provider.appTheme==ThemeMode.dark?
              MyTheme.blackColorDark:
              MyTheme.whiteColor
            ,
          borderRadius: BorderRadius.circular(20)
        ),
        child:widget.tasks.isDone==true?
        tasksIsDone():
        taskIsnotDone()
      ),
    );
  }

  Widget taskIsnotDone(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
          color: MyTheme.primaryColor,
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width*0.01,
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(ChangeContent.routeName,arguments: ChangeContentArgs(tasks: widget.tasks));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.tasks?.title?? "",style:Theme.of(context).textTheme.titleSmall,),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(widget.tasks?.description?? ""),
              )
            ],
          ),
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
          child: IconButton(
            onPressed:(){
              widget.tasks.isDone=true;
              print("tasks is done");
            },icon: Icon(Icons.check),
            color: MyTheme.whiteColor,style:ButtonStyle(
            iconSize: MaterialStatePropertyAll(30),
          ),
          ),
        ),
      ],
    );
  }

  Widget tasksIsDone() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
          color: MyTheme.greenColor,
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width*0.01,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.tasks?.title?? "",style:TextStyle(
                color: MyTheme.greenColor,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(widget.tasks?.description?? "",style:TextStyle(
                  color: MyTheme.greenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08),
          height: MediaQuery.of(context).size.height*0.03,
          width: MediaQuery.of(context).size.width*0.2,

          child:Text(AppLocalizations.of(context)!.done,style:TextStyle(
              color: MyTheme.greenColor,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
            textAlign: TextAlign.center,
          )
        ),
      ],
    );
  }
}
