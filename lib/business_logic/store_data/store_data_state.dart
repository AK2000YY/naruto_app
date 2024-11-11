part of 'store_data_bloc.dart';

sealed class StoreDataState extends Equatable {

  final int tableIndex;
  final int loadedElements;
  final bool isComplete;
  final String? error;

  const StoreDataState(this.tableIndex, this.loadedElements, this.isComplete, this.error);

  @override
  List<Object?> get props => [tableIndex, loadedElements, isComplete, error];

}

final class StoreDataInitial extends StoreDataState {
  const StoreDataInitial() : super(0, 0, false, null);
}

final class StoreDataLoad extends StoreDataState {
  const StoreDataLoad(int tableIndex, int loadedElements) :
        super(tableIndex, loadedElements, false, null);
}

final class StoreDataSuccess extends StoreDataState {
  const StoreDataSuccess(int tableIndex, int loadedElements, bool isComplete) :
        super(tableIndex, loadedElements, isComplete, null);
}

final class StoreDataFailure extends StoreDataState {
  const StoreDataFailure(int tableIndex, int loadedElements, String? error) :
        super(tableIndex, loadedElements, false, error);
}