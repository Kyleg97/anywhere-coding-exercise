import 'dart:async';
import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/app.dart';
import 'package:anywhere_coding_exercise/bloc/characters/characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

FutureOr<void> main() async {
  ApiManager().init();
  runApp(
    BlocProvider(
      create: (context) => CharactersBloc()..add(LoadCharacters()),
      child: const AnywhereApp(),
    ),
  );
}
