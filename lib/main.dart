import 'package:cc_task_final/pages/help_support.dart';
import 'package:flutter/material.dart';
import 'package:cc_task_final/pages/add_card.dart';
import 'pages/cards.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/card',
    routes: {
      '/card': (context) => const FlashCard(),
      '/help': (context) => const HelpSupport(),
      '/addCard': (context) => const AddCard(),
    },
  ));
}
