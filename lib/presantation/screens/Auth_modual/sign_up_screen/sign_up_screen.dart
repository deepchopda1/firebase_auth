import 'package:firebase_auth_app/presantation/app/app_routes.dart';
import 'package:firebase_auth_app/presantation/common_widgets/custom_button.dart';
import 'package:firebase_auth_app/presantation/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController controller = Get.put(SignUpController());

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //
  // final TextEditingController emailCtrl = TextEditingController();
  // final TextEditingController passwordCtrl = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp")),
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
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Password required";
                  if (value.length < 6) return "Minimum 6 characters";
                  return null;
                },
              ),
              SizedBox(height: 16),
              Obx(
                () => CustomButton(
                  onPressed: () {
                    if(controller.submit()) {
                      controller.signUp();
                    }
                  },
                  title: "Signup",
                  isLoading: controller.isLoading.value,
                ),
              ),
              TextButton(onPressed: () => Get.toNamed(AppRoutes.signIn), child: Text("Already have an account? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
