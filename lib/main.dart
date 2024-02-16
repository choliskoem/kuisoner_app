// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kusioner_ung/data/datasources/auth_remote_datasource.dart';
import 'package:kusioner_ung/data/datasources/kuisoner_remote_datasource.dart';
import 'package:kusioner_ung/presenstation/list/bloc/list/list_bloc.dart';

import 'package:kusioner_ung/splash_screen.dart';

import 'presenstation/detail/bloc/detail/detail_bloc.dart';

import 'presenstation/home/bloc/quisioner/quisioner_bloc.dart';
import 'presenstation/login/bloc/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => QuisionerBloc(KuisonerRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DetailBloc(KuisonerRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ListBloc(KuisonerRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Aplikasi Kuesioner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
