import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts/core/layout/contacts.dart';

import 'core/observer/bloc_observer.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Contacts(),
    );
  }
}
