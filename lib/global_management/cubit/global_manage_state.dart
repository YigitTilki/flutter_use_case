import 'package:equatable/equatable.dart';
import 'package:flutter_use_case/global_management/global_model.dart';

class GlobalManageState extends Equatable {
  const GlobalManageState({this.globalItems, this.isLoading = false});

  final List<GlobalModel>? globalItems;
  final bool isLoading;

  GlobalManageState copyWith({
    List<GlobalModel>? globalItems,
    bool? isLoading,
  }) {
    return GlobalManageState(
      globalItems: globalItems ?? this.globalItems,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [globalItems, isLoading];
}
