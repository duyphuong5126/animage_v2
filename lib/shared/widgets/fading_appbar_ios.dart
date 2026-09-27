import 'package:flutter/cupertino.dart';

class FadingAppBarIOS extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  final CupertinoNavigationBar appBar;
  final AnimationController controller;

  const FadingAppBarIOS({
    super.key,
    required this.appBar,
    required this.controller,
  });

  @override
  State<FadingAppBarIOS> createState() => _FadingAppBarIOSState();

  @override
  Size get preferredSize => appBar.preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return false;
  }
}

class _FadingAppBarIOSState extends State<FadingAppBarIOS> {
  @override
  void initState() {
    super.initState();
    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: widget.controller,
        curve: Curves.easeOut,
      ),
      child: widget.appBar,
    );
  }
}
