import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:l_flutter_pizza_app_v3_dot_15b01/app.dart';
import 'package:l_flutter_pizza_app_v3_dot_15b01/simple_observer_bloc.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = SimpleObserverBloc();

  runApp(MyApp(FirebaseUserRepo()));
}

