import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser({
  required String name,
  required String city,
  required int age,
}) async {
  await firestore.collection("users").add({
    "name": name,
    "age": age,
    "city": city,
  });
}

Future<void> getUser() async {
  QuerySnapshot snapshot = await firestore.collection("users").get();
}
