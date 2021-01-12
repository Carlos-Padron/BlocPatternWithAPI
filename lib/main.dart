import 'package:BlocPatternWithAPI/services/dataService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './modules/MainPage/view/MainScreen.dart';
import 'modules/MainPage/cubit/collection_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit',
      home: BlocProvider(
        create: (context) => CollectionCubit(dataService: DataService()),
        child: MainScreen(),
      ),
    );
  }
}
