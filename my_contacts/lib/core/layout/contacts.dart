import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_contacts/core/layout/controller/state.dart';
import 'package:my_contacts/core/shared/widget/myformfield.dart';

import 'controller/cubit.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ContactsCubit()..createDB(),
      child: BlocConsumer<ContactsCubit, ContactsStates>(
        listener: (context, state) {
          if(state is ContactInsertDataFromDBState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = ContactsCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            backgroundColor: HexColor('#10131A'),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: HexColor('#212531'),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.navBarItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              unselectedItemColor: HexColor('#A7AAB1'),
              selectedItemColor: HexColor('#D9D9E1'),
              backgroundColor: HexColor('#212531'),
              type: BottomNavigationBarType.fixed,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isPressed) {
                  if(cubit.formKey.currentState!.validate()){
                    cubit.insertDB(
                        firstName: cubit.firstnameController.text,
                        lastName: cubit.lastnameController.text,
                        num: cubit.numController.text
                    );
                    cubit.changeFabIcon(isPressedd: false, icon: Icons.edit);
                  }
                } else {
                  cubit.scaffoldKey.currentState!.showBottomSheet((context) => Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MyFormField(
                              controller: cubit.firstnameController,
                              type: TextInputType.text,
                              prefix: Icons.person,
                              text: 'First Name',
                              isPassword: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'First Name Must Not Be Empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.0),
                            MyFormField(
                              controller: cubit.lastnameController,
                              type: TextInputType.text,
                              prefix: Icons.person,
                              text: 'Last Name',
                              isPassword: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Last Name Must Not Be Empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.0),
                            MyFormField(
                              controller: cubit.numController,
                              type: TextInputType.phone,
                              prefix: Icons.phone,
                              text: 'Phone Number',
                              isPassword: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone Must Not Be Empty';
                                }else if(value.length<11 || value.length>11){
                                  return 'Phone Number Must Be 11 Digits';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  )
                      .closed.then((value) {
                    cubit.changeFabIcon(isPressedd: false, icon: Icons.edit);
                  });
                  cubit.changeFabIcon(isPressedd: true, icon: Icons.add);
                }
              },
              backgroundColor: HexColor('#D9D9E1'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(cubit.fabIcon),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
