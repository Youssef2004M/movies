import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/firebase_manager.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/tabs/home_tab.dart';
import 'package:movies_app/login_screen.dart';
import 'package:movies_app/my_text_field.dart';
import 'package:movies_app/validation.dart';

import 'app_colors/colors.dart';
import 'onBoarding.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  bool passToggle = true;
  bool confirmPassToggle = true;

  final formKey = GlobalKey<FormState>();

  List<String> avatars = [
    AppImages.avatar3,
    AppImages.avatar1,
    AppImages.avatar2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 161,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          child: Image.asset(
                            avatars[index],
                          ));
                    },
                    itemCount: avatars.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                MyTextField(
                  label: "Name",
                  ctrl: nameController,
                  type: TextInputType.name,
                  validate: (value) => MyValidation.nameValidation(value),
                ),
                MyTextField(
                  label: "Email",
                  ctrl: emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) => MyValidation.emailValidation(value),
                ),
                TextFormField(
                  obscureText: passToggle == true ? true : false,
                  obscuringCharacter: "*",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          passToggle = !passToggle;
                          setState(() {});
                        },
                        child: Icon(
                          passToggle == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  controller: passController,
                  validator: (value) => MyValidation.passValidation(value),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  obscureText: confirmPassToggle == true ? true : false,
                  obscuringCharacter: "*",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Confirm Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          confirmPassToggle = !confirmPassToggle;
                          setState(() {});
                        },
                        child: Icon(
                          confirmPassToggle == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  controller: confirmPassController,
                  validator: (value) {
                    if (passController.text != value) {
                      return "It Doesn`t Match With Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                MyTextField(
                  label: "Phone Number",
                  ctrl: phoneController,
                  type: TextInputType.phone,
                  validate: (value) => MyValidation.phoneValidation(value),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseManager.createAccount(
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          passController.text, () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Center(
                                child: CircularProgressIndicator(
                              color: AppColors.yellow,
                            )),
                            backgroundColor: AppColors.grey,
                          ),
                        );
                      }, () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routeName,
                          (route) => false,
                        );
                      }, (message) {
                        Navigator.pop(context);
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.grey,
                            title: Text(
                              "Error",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColors.red),
                            ),
                            content: Text(message),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"))
                            ],
                          ),
                        );
                      });
                    }
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ? ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.yellow),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
