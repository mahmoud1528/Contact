import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/controller/cubit.dart';
import '../widget/myformfield.dart';

class EditWidget extends StatelessWidget {
  final Map model;
  const EditWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ContactsCubit>(context);

    cubit.firstnameController.text = model['Firstname'];
    cubit.lastnameController.text = model['Lastname'];
    cubit.numController.text = model['num'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: HexColor('#212531'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  Center(
        child: Container(
          color: HexColor('#10131A'),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  MyFormField(
                    style: TextStyle(color: Colors.black),
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
                  SizedBox(height: 40.0),
                  MyFormField(
                    style: TextStyle(color: Colors.black),
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
                  SizedBox(height: 40.0),
                  MyFormField(
                    style: TextStyle(color: Colors.black),
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
                  SizedBox(height: 60.0),
                  MaterialButton(
                    onPressed: () {
                      if(cubit.formKey.currentState!.validate()){
                        cubit.updateDB(
                          id: model['id'],
                          firstname: cubit.firstnameController.text,
                          lastname: cubit.lastnameController.text,
                          num: cubit.numController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    minWidth: 200.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.green,
                    child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 25.0),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
