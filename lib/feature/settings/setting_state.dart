import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
sealed class SettingState with _$SettingState {
  const factory SettingState.initial() = SettingInitialState;

  const factory SettingState.initialized({
    required String appName,
    required String appVersion,
  }) = SettingInitializedState;
}