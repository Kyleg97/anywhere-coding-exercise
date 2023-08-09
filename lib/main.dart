import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/bloc/wire/wire_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SimpsonsBloc()),
        BlocProvider(create: (context) => WireBloc()),
      ],
      child: const AnywhereeApp(),
    ),
  );
}

// final appRouter = AppRouter();

class AnywhereeApp extends StatelessWidget {
  const AnywhereeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
