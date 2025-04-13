import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contacts/core/layout/controller/cubit.dart';
import 'package:my_contacts/core/layout/controller/state.dart';

import '../../../../../core/shared/contact_widget/generator.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsCubit,ContactsStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var tasks = ContactsCubit.get(context).favTask;
        return Generator(tasks: tasks,);
      },
    );
  }
}
