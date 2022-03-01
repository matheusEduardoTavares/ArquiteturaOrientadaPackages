import 'package:business_layer/business_layer.dart';

class TodolistState {
  TodolistState({
    required this.items,
    required this.isRequesting,
    required this.errorMessage,
  });

  factory TodolistState.initial() => TodolistState(
    items: [], 
    isRequesting: false, 
    errorMessage: '',
  );

  final List<TodolistModel> items;
  final bool isRequesting;
  final String errorMessage;

  TodolistState copyWith({
    List<TodolistModel>? items,
    bool? isRequesting,
    String? errorMessage,
  }) {
    return TodolistState(
      items: items ?? this.items,
      isRequesting: isRequesting ?? this.isRequesting,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
