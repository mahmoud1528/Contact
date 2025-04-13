import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../core/layout/controller/cubit.dart';
import '../../../../../core/layout/controller/state.dart';
import '../../../../../core/shared/contact_widget/generator.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsCubit, ContactsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = ContactsCubit.get(context).contactTask;
        return Generator(tasks: tasks);
      },
    );
  }
}
