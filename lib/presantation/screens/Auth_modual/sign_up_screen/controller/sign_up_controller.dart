import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_routes.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  RxBool isLoading = false.obs;

  bool submit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if(!isValid) {
      return false;
    }
    formKey.currentState!.save();
    return true;
  }

  Future<void> signUp() async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );
      log("@@@ email: ${emailCtrl.text}");
      log("@@@ password: ${passwordCtrl.text}");
      Get.snackbar("Success", "Account created");
      Get.offAllNamed(AppRoutes.signIn);
    } on FirebaseAuthException catch(e) {
      Get.snackbar("Error", e.message ?? "Signup failed");
      log("@@@ Error: ${e.message}");
    } finally {
      isLoading.value = false;
    }
  }
}