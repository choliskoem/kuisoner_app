import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kusioner_ung/presenstation/detail/bloc/detail/detail_bloc.dart';

import '../widgets/detail_appbar.dart';
import '../widgets/detail_result.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<DetailBloc>().add(DetailEvent.fetch(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(),
          DetailResult(),
        ],
      ),
    );
  }
}
