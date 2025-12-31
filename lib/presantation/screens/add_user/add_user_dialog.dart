import 'package:firebase_auth_app/data/services/firebase_crud_service.dart';
import 'package:firebase_auth_app/presantation/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_textfield.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key});

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();

  bool submit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (!isValid) {
      return false;
    }
    formKey.currentState!.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text("Name"),
              SizedBox(height: 10),
              CustomTextField(
                controller: nameCtrl,
                label: "Name",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name required";
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text("City"),
              SizedBox(height: 10),
              CustomTextField(
                controller: cityCtrl,
                label: "City",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) return "City required";
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text("Age"),
              SizedBox(height: 10),
              CustomTextField(
                controller: ageCtrl,
                label: "Age",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) return "Age required";
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () => Get.back(),
                      title: "Cancel",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        if (submit()) {
                          addUser(
                            name: nameCtrl.text,
                            city: cityCtrl.text,
                            age: int.parse(ageCtrl.text),
                          );
                        }
                      },
                      title: "Save",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
