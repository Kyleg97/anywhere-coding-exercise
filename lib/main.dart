import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/bloc/wire/wire_bloc.dart';
import 'package:anywhere_coding_exercise/screens/variant_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ApiManager().init();
  runApp(
    // TODO: we should check which variant we are using so we don't
    // waste resources calling the unused endpoint
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SimpsonsBloc()..add(LoadSimpsonsCharacters()),
        ),
        BlocProvider(
          create: (context) => WireBloc()..add(LoadWireCharacters()),
        ),
      ],
      child: const AnywhereApp(),
    ),
  );
}

// final appRouter = AppRouter();

class AnywhereApp extends StatelessWidget {
  const AnywhereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VariantOne(),
    );
  }
}
