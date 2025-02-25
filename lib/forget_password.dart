import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/app_colors/colors.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "ForgetPassword";
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forget Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.forgetPass),
            SizedBox(height: 24,),
            TextField(
              decoration: InputDecoration(
                  label: Text(
                    "Email",
                    style: TextStyle(color: Colors.white),
                  ),
                filled: true,
                fillColor: AppColors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
            SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Verify Email",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
