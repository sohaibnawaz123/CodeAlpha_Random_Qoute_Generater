import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomqoutegeneraterapp/Screen/Homescreen.dart';
import 'package:randomqoutegeneraterapp/bloc/randomQoute_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomqouteBloc>(
      create: (_) => RandomqouteBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Random Qoute Generater', home: Homescreen()),
    );
  }
}
