import 'dart:ui';

import 'package:BlocPatternWithAPI/models/Book.dart';
import 'package:BlocPatternWithAPI/modules/MainPage/componets/card_component.dart';
import 'package:BlocPatternWithAPI/modules/MainPage/componets/header_component.dart';
import 'package:BlocPatternWithAPI/modules/MainPage/cubit/collection_cubit.dart';
import 'package:BlocPatternWithAPI/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _loadCollection();
  }

  _loadCollection() async {
    context.read<CollectionCubit>().getBooks();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: secondaryColor,
        body: _body(height),
      ),
    );
  }

  Widget _body(height) {
    return Column(
      children: [
        Stack(
          children: [
            HeaderComponent(),
            BlocBuilder<CollectionCubit, CollectionState>(
              builder: (context, state) {
                print(state);
                if (state is CollectionFetching) {
                  print('mostrar indicador');
                  return _bookListLoading(height);
                } else if (state is CollectionFetched) {
                  return _buildBookListUI(height, state.books);
                } else if (state is CollectionError) {
                  return _displayError(height, state.errorMsg);
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ],
    );
  }

  Column _bookListLoading(height) {
    print('rendering widget');
    return Column(
      children: [
        SizedBox(
          height: height * 0.25,
        ),
        Container(
          height: height - (height * 0.25),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Column _buildBookListUI(double height, List<Book> collection) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.17,
        ),
        RefreshIndicator(
          onRefresh: _refreshData,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 0),
            height: height - (height * 0.17),
            child: GridView.count(
              padding: EdgeInsets.symmetric(vertical: 0),
              crossAxisCount: 2,
              children: List.generate(
                collection.length,
                (index) {
                  return CardComponent(
                    collection: collection[index],
                    index: index,
                    context: context,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayError(height, err) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.25,
        ),
        Container(
          height: height - (height * 0.25),
          child: Center(
            child: Text(
              err,
              style: TextStyle(
                color: defaultColor,
                fontSize: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _refreshData() async {
    context.read<CollectionCubit>().getBooks();
  }
}
