import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/core/shared/language_cache_helper.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageInitial()) {
    on<LanguageStarted>(_onStarted);
    on<LanguageChanged>(_onChange);
  }

  Future<void> _onStarted(LanguageStarted event, Emitter<LanguageState> emit) async {
    final languageCode = await LanguageCacheHelper.getCachedLanguage();
    print("Ak2000yy");
    print(languageCode);
    emit(LanguageLoaded(languageCode));
  }

  Future<void> _onChange(LanguageChanged event, Emitter<LanguageState> emit) async {
    await LanguageCacheHelper.cacheLanguageCode(event.languageCode!);
    emit(LanguageLoaded(event.languageCode));
  }
}
