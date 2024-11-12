part of 'store_data_bloc.dart';

sealed class StoreDataState extends Equatable {

  final int tableIndex;
  final int loadedElements;
  final int totalElements;
  final bool isComplete;
  final String? error;

  const StoreDataState(this.tableIndex, this.loadedElements, this.totalElements, this.isComplete, this.error);

  @override
  List<Object?> get props => [tableIndex, loadedElements, totalElements, isComplete, error];

}

final class StoreDataInitial extends StoreDataState {
  const StoreDataInitial() : super(0, 0, 1, false, null);
}

final class StoreDataSuccess extends StoreDataState {
  const StoreDataSuccess(int tableIndex, int loadedElements, int totalElements, bool isComplete) :
        super(tableIndex, loadedElements, totalElements, isComplete, null);
}

final class StoreDataFailure extends StoreDataState {
  const StoreDataFailure(int tableIndex, int loadedElements, int totalElements, String? error) :
        super(tableIndex, loadedElements, totalElements, false, error);
}