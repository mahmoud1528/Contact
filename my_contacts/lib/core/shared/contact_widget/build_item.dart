import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contacts/core/layout/controller/cubit.dart';
import 'package:my_contacts/core/layout/controller/state.dart';

import '../widget/myformfield.dart';
import 'edit_widget.dart';

class BuildItem extends StatelessWidget {
  final Map model;

  Color generateColor() {
    final String name = model['Firstname'] + model['Lastname'];
    final int hash = name.hashCode;

    return Colors.primaries[hash % Colors.primaries.length];
  }

  const BuildItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsCubit, ContactsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ContactsCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: generateColor(),
                    radius: 30.0,
                    child: Text(
                      "${model['Firstname'][0]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${model['Firstname']} ${model['Lastname']}",
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        Text(
                          model['num'],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String isFav = model['fav'];
                      cubit.changeRowIcon(
                        function:
                            () => cubit.updateFavDB(
                              id: model['id'],
                              fav: (isFav == 'Yes') ? 'No' : 'Yes',
                            ),
                      );
                    },
                    icon: Icon(
                      model['fav'] == 'Yes'
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.yellow,
                      size: 30.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: EditWidget(model: model),
                            ),
                        ),
                      );
                      //debugPrint('Edit Clicked');
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.deleteDB(id: model['id']);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
