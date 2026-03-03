import 'package:chat_app/features/home/view/widgets/home_app_bar.dart';
import 'package:chat_app/features/home/view/widgets/home_text_filed.dart';
import 'package:chat_app/features/home/view/widgets/one_of_message.dart';
import 'package:chat_app/features/home/view_model/home_cubit.dart';
import 'package:chat_app/features/home/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar: HomeTextFiled(),
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: state is HomeSuccess
                ? ListView.builder(
                    reverse: true,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final data = state.data[index];
                      return OneOfMessage(state: data);
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
