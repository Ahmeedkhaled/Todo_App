import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import '../../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChangeContent extends StatefulWidget {
static const String routeName="change_content";

  @override
  State<ChangeContent> createState() => _ChangeContentState();
}

class _ChangeContentState extends State<ChangeContent> {
var formKey=GlobalKey<FormState>();
String title="";
String description="";
DateTime selectedDate=DateTime.now();


  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as ContentArgs;
    var provider=Provider.of<AppConfigProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: MyTheme.whiteColor
          ),
        ),
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height*0.08,
          horizontal: MediaQuery.of(context).size.height*0.05,
        ),
        decoration: BoxDecoration(
          color: provider.appTheme==ThemeMode.dark?
          MyTheme.blackColorDark:
          MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.edit_task,style: Theme.of(context).textTheme.bodyMedium,),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: args.tasks.title,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "please enter your title";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 10),
                              hintText: AppLocalizations.of(context)!.this_is_title,
                              hintStyle: Theme.of(context).textTheme.bodyLarge,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyTheme.grayColor,
                                  ))),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: args.tasks.description,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "please enter your details";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 10),
                              hintText: AppLocalizations.of(context)!
                              .task_details,
                              hintStyle: Theme.of(context).textTheme.bodyLarge,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyTheme.grayColor,
                                  ))),
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          AppLocalizations.of(context)!.select_date,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCalendar();
                          args.tasks.dateTime=selectedDate;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${args.tasks.dateTime!.day}/${args.tasks.dateTime!.month}/${args.tasks.dateTime!.year}",
                            style: Theme.of(context).textTheme.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height*0.07,
                          horizontal: MediaQuery.of(context).size.width*0.03
                        ),
                        child: ElevatedButton(

                            onPressed: () {

                            },
                            child: Text(
                              AppLocalizations.of(context)!.save_changes,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white30
                              ),
                            ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height*0.02,

                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                        ),
                      ),
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }

void showCalendar() async {
  var chossenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)));
  if (chossenDate != null) {
    selectedDate = chossenDate;
    setState(() {});
  }
}}
class ContentArgs{
  Tasks tasks;
  ContentArgs({required this.tasks});
}
