part of 'store_data_bloc.dart';


sealed class StoreDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class StoreDataFetched extends StoreDataEvent {}