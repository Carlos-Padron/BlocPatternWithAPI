import 'dart:ui';

import 'package:BlocPatternWithAPI/modules/MainPage/cubit/collection_cubit.dart';
import 'package:BlocPatternWithAPI/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(20),
      height: height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(color: primaryColor),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            child: Text(
              'Books Collection',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: warningColor,
                shape: BoxShape.circle,
              ),
              child: FlatButton(
                onPressed: () => {
                  _showSelectedBooksInfo(context),
                },
                child: Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showSelectedBooksInfo(context) {
    int count = BlocProvider.of<CollectionCubit>(context).selectedBooks();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 150,
            width: double.infinity,
            color: Colors.indigoAccent,
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
