import 'package:chat_app/features/home/model/message_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<MessageModel> data;
  HomeSuccess({required this.data});
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}
