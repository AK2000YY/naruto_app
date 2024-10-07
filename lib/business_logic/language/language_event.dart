part of 'language_bloc.dart';


sealed class LanguageEvent extends Equatable {
  final String? languageCode;

  const LanguageEvent([this.languageCode]);

  @override
  List<Object?> get props => [languageCode];
}

final class LanguageStarted extends LanguageEvent {
  const LanguageStarted();
}

final class LanguageChanged extends LanguageEvent {
  const LanguageChanged(super.languageCode);
}
