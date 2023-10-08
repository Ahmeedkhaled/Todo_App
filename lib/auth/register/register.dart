import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/login/login.dart';
import 'package:todo_app/component/custom_text_field.dart';
import 'package:todo_app/dialog_utils.dart';
import 'package:todo_app/home/home_page.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

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
              AppLocalizations.of(context)!.create_account,
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
                    label: "User Name",
                    controller: nameController,
                    validator: (text) {
                      if (text!.trim().isEmpty || text == null) {
                        return "please enter your user name";
                      }
                      return null;
                    },
                  ),
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
                  CustomTextFormField(
                    label: "Confirm Password",
                    keyboardType: TextInputType.number,
                    controller: confirmPasswordController,
                    validator: (text) {
                      if (text!.trim().isEmpty || text == null) {
                        return "please enter your confirm password";
                      }
                      if (text != passwordController.text) {
                        return "confirmPassword doesn't match";
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 12
                        )
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  }, child: Text("Already Have An Account"))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  void register()async {
    if(formState.currentState!.validate()==true){
      DialogUtils.showLoading(context, "Loading");
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        );
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, "Register Successfully",posActionName: "ok");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'The password provided is too weak.',title: "Error",posActionName: "ok",posAction: (){
            Navigator.pushNamed(context, HomePage.routeName);
          });
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'The account already exists for that email.',title: "Error",posActionName: "ok");
        }
      } catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context,e.toString(),title: "Error",posActionName: "ok");
        print(e);
      }
    }
  }
}
