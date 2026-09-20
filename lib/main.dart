import 'package:animage/constant.dart';
import 'package:animage/feature/downloader/download_cubit.dart';
import 'package:animage/feature/gallery/gallery_page.dart';
import 'package:animage/feature/home/home_page.dart';
import 'package:animage/feature/photo_viewer/photo_view_page.dart';
import 'package:animage/feature/post_detail/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AnimageAndroidApp());
}

class AnimageAndroidApp extends StatelessWidget {
  const AnimageAndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return BlocProvider(
      create: (context) => DownloadCubit(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: .fromSeed(
            seedColor: brandColor,
            surface: isDark ? black : white,
            onSurface: isDark ? white : black,
          ),
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0.0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Trạng thái icon/chữ: dùng .dark (chữ đen) cho nền sáng, và .light (chữ trắng) cho nền tối
              statusBarIconBrightness: isDark
                  ? Brightness.light
                  : Brightness.dark,
              // Cho Android
              statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
              // Cho iOS
              statusBarColor: Colors.transparent, // Giữ thanh trạng thái trong suốt phẳng với AppBar
            ),
          ),
        ),
        routes: {
          '/': (context) => const HomePage(),
          detailsPageRoute: (context) => const PostDetailPage(),
          photoViewerRoute: (context) => const PhotoViewPage(),
        },
      ),
    );
  }
}
