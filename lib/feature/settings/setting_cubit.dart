import 'dart:async';

import 'package:animage/feature/settings/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingState.initial());

  void init() {
    unawaited(_init());
  }

  Future<void> _init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    emit(
      SettingState.initialized(
        appName: packageInfo.appName,
        appVersion: packageInfo.version,
      ),
    );
  }
}
