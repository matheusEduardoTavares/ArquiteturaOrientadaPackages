import 'package:business_layer/business_layer.dart';

class TodolistState {
  TodolistState({
    required this.allItems,
    required this.itemsToShow,
    required this.isRequesting,
    required this.errorMessage,
  });

  factory TodolistState.initial() => TodolistState(
    allItems: [], 
    itemsToShow: [], 
    isRequesting: false, 
    errorMessage: '',
  );

  final List<TodolistModel> allItems;
  final List<TodolistModel> itemsToShow;
  final bool isRequesting;
  final String errorMessage;

  TodolistState copyWith({
    List<TodolistModel>? allItems,
    List<TodolistModel>? itemsToShow,
    bool? isRequesting,
    String? errorMessage,
  }) {
    return TodolistState(
      allItems: allItems ?? this.allItems,
      itemsToShow: itemsToShow ?? this.itemsToShow,
      isRequesting: isRequesting ?? this.isRequesting,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
