// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

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
