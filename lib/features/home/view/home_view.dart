import 'package:chat_app/features/home/view/widgets/home_body.dart';
import 'package:chat_app/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getMessage(),
      child: HomeBody(),
    );
  }
}
