import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/app_colors/colors.dart';

typedef Validation = String? Function(String?)?;

class MyTextField extends StatelessWidget {
  String label;
  Validation validate;
  TextEditingController ctrl;
  TextInputType type;

  MyTextField(
      {super.key,
      required this.label,
      required this.validate,
      required this.ctrl,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validate,
          controller: ctrl,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              label: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              prefixIcon: ImageIcon(
                AssetImage(
                  label == "Name"
                      ? AppImages.nameIcon
                      : label == "Email"
                          ? AppImages.emailIcon
                          : AppImages.phoneIcon,
                ),
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }
}
