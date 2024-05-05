import 'package:bloc_flutter/MultiBlocListener/bloc/counter.dart';
import 'package:bloc_flutter/MultiBlocListener/bloc/theme.dart';
import 'package:bloc_flutter/MultiBlocListener/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
    ], child: App());
  }
}
