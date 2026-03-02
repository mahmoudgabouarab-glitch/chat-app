import 'package:cloud_firestore/cloud_firestore.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<QueryDocumentSnapshot<Object?>> data;
  HomeSuccess({required this.data});
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}
