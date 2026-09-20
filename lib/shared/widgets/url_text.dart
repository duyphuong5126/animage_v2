import 'package:animage/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  final String url;
  final String? label;
  final TextStyle? textStyle;

  const UrlText({super.key, required this.url, this.label, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label ?? url,
            style: (textStyle ?? TextStyle()).copyWith(
              color: brandColor,
              decoration: TextDecoration.underline,
              decorationColor: brandColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final Uri uri = Uri.parse(url);
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $url');
                }
              },
          ),
        ],
      ),
    );
  }
}
