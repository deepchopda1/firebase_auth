import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignIn")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: controller.emailCtrl,
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email required";
                  if (!GetUtils.isEmail(value)) return "Enter valid email";
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: controller.passwordCtrl,
                label: "Password",
                isPassword: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password required";
                  }
                  if (value.length < 6) return "Minimum 6 characters";
                  return null;
                },
              ),
              SizedBox(height: 16),
              Obx(
                () => CustomButton(
                  onPressed: () {
                    if (controller.submit()) {
                      controller.signIn();
                    }
                  },
                  title: "Sign In",
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
