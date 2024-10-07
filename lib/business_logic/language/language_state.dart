part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  final String? languageCode;

  const LanguageState([this.languageCode]);

  @override
  List<Object?> get props => [languageCode];

}

final class LanguageInitial extends LanguageState {
  const LanguageInitial();
}

final class LanguageLoaded extends LanguageState {
  const LanguageLoaded(super.languageCode);
}
