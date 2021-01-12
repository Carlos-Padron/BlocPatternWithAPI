import 'dart:ui';

import 'package:BlocPatternWithAPI/models/Book.dart';
import 'package:BlocPatternWithAPI/modules/MainPage/cubit/collection_cubit.dart';
import 'package:BlocPatternWithAPI/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardComponent extends StatelessWidget {
  final int index;
  final Book collection;
  final BuildContext context;
  CardComponent(
      {Key key,
      @required this.context,
      @required this.index,
      @required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 180,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _descripctionContainer(context, index),
          ),
          _imageConainter(this.index),
        ],
      ),
    );
  }

  Widget _descripctionContainer(BuildContext context, index) {
    return GestureDetector(
      onTap: () {
        _selectCollection(context, index);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 55,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        margin: EdgeInsets.all(4),
        height: 120,
        decoration: BoxDecoration(
          color: _isSelected(collection),
          borderRadius: BorderRadius.all(
            Radius.circular(12.5),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8898aa).withOpacity(0.15),
              offset: Offset(0, 0),
              blurRadius: 2,
            )
          ],
        ),
        child: Text(
          collection.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _imageConainter(index) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: padding * 3),
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? successColor : dangerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.5),
        ),
        boxShadow: [
          BoxShadow(
            color: (index % 2 == 0)
                ? successColor.withOpacity(
                    1,
                  )
                : dangerColor.withOpacity(
                    1,
                  ),
            blurRadius: 10,
          )
        ],
      ),
      child: Icon(
        Icons.book,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  void _selectCollection(BuildContext context, int index) {
    BlocProvider.of<CollectionCubit>(context).selectBooks(index);
  }

  Color _isSelected(Book collection) =>
      (collection.isSelected) ? selectedColor : Colors.white;
}
