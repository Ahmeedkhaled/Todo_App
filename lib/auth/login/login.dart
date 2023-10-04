import 'package:flutter/material.dart';
import 'package:todo_app/auth/login/login.dart';
import 'package:todo_app/auth/register/register.dart';
import 'package:todo_app/component/custom_text_field.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/List/add_bottom_sheet.dart';
import 'package:todo_app/home/List/list_tab.dart';
import 'package:todo_app/home/List/task_widget.dart';
import 'package:todo_app/home/settings/settings_tab.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset("assets/images/main_background_image.png",
                  width: double.infinity, fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.07),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(
                    color: MyTheme.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.4,
                    horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        label: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (text) {
                          if (text!.trim().isEmpty || text == null) {
                            return "please enter your email";
                          }
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "pelese enter valid email";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: "Password",
                        keyboardType: TextInputType.number,
                        controller: passwordController,
                        validator: (text) {
                          if (text!.trim().isEmpty || text == null) {
                            return "please enter your password";
                          }
                          if (text.length < 6) {
                            return "password should be at least 6 char";
                          }
                          return null;
                        },
                        isPassword: true,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(RegisterScreen.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Don't have an Account",style: Theme.of(context).textTheme.bodyMedium,),
                                TextButton(onPressed: (){
                                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                                }, child: Text("Sign up",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),

                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void login() {
    if(formState.currentState!.validate()==true){

    }
  }
}

