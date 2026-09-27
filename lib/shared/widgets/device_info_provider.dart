import 'package:flutter/widgets.dart';

class DeviceInfoProvider extends InheritedWidget {
  const DeviceInfoProvider({
    super.key,
    required super.child,
    required this.isTablet,
  });

  final bool isTablet;

  static DeviceInfoProvider of(BuildContext context) {
    final DeviceInfoProvider? result = context
        .dependOnInheritedWidgetOfExactType<DeviceInfoProvider>();
    assert(result != null, 'No DeviceInfoProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DeviceInfoProvider old) {
    return old.isTablet != isTablet;
  }
}
