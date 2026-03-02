import 'package:chat_app/core/network/fire_base_helper.dart';
import 'package:chat_app/features/home/model/message_model.dart';
import 'package:chat_app/features/home/view_model/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  TextEditingController message = .new();
  GlobalKey<FormState> formKey = .new();
  //add message
  void addMessage() {
    FBHelper.addMessage(message: message.text);
    message.clear();
  }

  //get message
  Future<void> getMessage() async {
    emit(HomeLoading());
    try {
      FBHelper.getMessage().listen((event) {
        final List<MessageModel> messages = event.docs
            .map<MessageModel>((doc) => MessageModel.fromJson(doc))
            .toList();

        emit(HomeSuccess(data: messages));
      });
    } on FirebaseException catch (e) {
      emit(HomeFailure(message: e.code));
      print("-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-===$e");
    }
  }

  //delete message
  void deleteMessage({required String id}) {
    FBHelper.deleteMessage(id: id);
  }

  //update message
  void updateMessage({
    required String editMessage,
    required String fBD,
    required String fBC,
    required String id,
  }) {
    FBHelper.updateMessage(editMessage: editMessage, id: id);
  }

  @override
  Future<void> close() {
    message.dispose();
    return super.close();
  }
}
