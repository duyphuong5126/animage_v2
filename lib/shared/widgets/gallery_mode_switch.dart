import 'package:animage/constant.dart';
import 'package:flutter/material.dart';

import '../../dimension.dart';
import '../enum/gallery_mode.dart';

class GalleryModeSwitch extends StatelessWidget {
  const GalleryModeSwitch({
    super.key,
    required this.onModeSelected,
    required this.galleryMode,
  });

  final Function(GalleryMode) onModeSelected;
  final GalleryMode galleryMode;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    Color? unSelectedModeColor = isDark ? white : grey189;
    Color? bgColor = isDark ? black : white;
    final isGrid = galleryMode == GalleryMode.grid;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(space1)),
        color: bgColor,
      ),
      padding: EdgeInsets.all(space1),
      child: SizedBox(
        height: space4,
        width: 100,
        child: Container(
          height: spaceHalf,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(spaceHalf)),
            border: Border.all(color: brandColor),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () => onModeSelected(GalleryMode.list),
                  icon: Icon(
                    Icons.list,
                    color: isGrid ? unSelectedModeColor : brandColor,
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: spaceQuarter,
                  ),
                ),
              ),
              Container(width: 1, color: brandColor),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () => onModeSelected(GalleryMode.grid),
                  icon: Icon(
                    Icons.grid_view,
                    color: isGrid ? brandColor : unSelectedModeColor,
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: spaceQuarter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
