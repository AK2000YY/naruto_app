// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

part of 'store_data_bloc.dart';


sealed class StoreDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class StoreDataFetched extends StoreDataEvent {}