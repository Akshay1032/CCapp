import 'package:flutter/material.dart';
import 'package:cc_task_final/user_set.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Stream<List<UserSet>> readCards()  {
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = FirebaseFirestore.instance.collection('UserData').snapshots();
  return snapshots.map((event) => event.docs.map((e) => UserSet.fromJson(e.data())).toList());
}

Future deleteCard({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('cardQuestions').doc(name);
  docUser.delete();
}

Widget buildUser(UserSet questionSet) =>
    const ListTile(
      // leading: CircleAvatar(child: Text('${user.birthday}')),
      //title: Text(questionSet.question),
      //subtitle: Text(questionSet.answer),
      title: Text("Akshay"),
    );