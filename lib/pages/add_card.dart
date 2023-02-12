import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future createCard({required String name, required String designation}) async  {
  final docUser = FirebaseFirestore.instance.collection('UserData').doc(name);
  final json = {
    'name' : name,
    'designation': designation,
  };

  await docUser.set(json);
}

class AddCard extends StatefulWidget {

  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _textNameController = TextEditingController();
  final _textDesignationController = TextEditingController();
  String userName = ' ';
  String userDesignation = ' ';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /*Expanded(
                      child: Container(
                          color: Colors.teal,
                          child: Center(
                              child: Text('$userQuestion, $userAnswer')))
                  ),*/
                  TextField(controller:  _textNameController,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border:  const OutlineInputBorder(),
                      hintText: 'Name',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _textNameController.clear();
                          },
                          icon: const Icon(Icons.clear)),
                    ),
                  ),
                  const SizedBox(height:10),
                  TextField(controller:  _textDesignationController,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border:  const OutlineInputBorder(),
                      hintText: 'Designation',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _textDesignationController.clear();
                          },
                          icon: const Icon(Icons.clear)),
                    ),
                  ),
                  const SizedBox(height:10),
                  MaterialButton(onPressed: (){
                      setState(() {
                        if ((_textNameController.text.isNotEmpty) && (_textDesignationController.text.isNotEmpty)){
                          userName = _textNameController.text;
                          userDesignation = _textDesignationController.text;
                          //questionBank.add(QuestionSet(name: userName, answer: userDesignation));
                          createCard(name: userName, designation: userDesignation);
                          Navigator.pop(context,);
                        }
                      });
                    },
                  color: Colors.grey,
                  child: const Text("Add Card",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )
                  )
                  ),
                ],
              ),
            ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Add A New User",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w200
              )),
        ),
      ),
    );
  }
}
