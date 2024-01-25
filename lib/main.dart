// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kusioner_ung/data/datasources/auth_remote_datasource.dart';
import 'package:kusioner_ung/data/datasources/kuisoner_remote_datasource.dart';
import 'package:kusioner_ung/presenstation/quisoner/pages/quisoner_page.dart';

import 'data/datasources/auth_local_datasource.dart';
import 'presenstation/login/bloc/bloc/login_bloc.dart';
import 'presenstation/login/pages/login_page.dart';
import 'presenstation/quisoner/bloc/bloc/quisoner_bloc.dart';

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
          create: (context) => QuisonerBloc(KuisonerRemoteDatasource()),
        )
      ],
      child: MaterialApp(
        title: 'Aplikasi Kuesioner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isAuth(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return const QuisonerPage();
              } else {
                return const LoginPage();
              }
            }),
      ),
    );
  }
}
