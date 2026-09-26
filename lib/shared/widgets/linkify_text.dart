import 'package:animage/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkifyText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  const LinkifyText(this.text, {super.key, this.textStyle, this.linkStyle});

  @override
  Widget build(BuildContext context) {
    // Basic RegEx pattern to match URLs starting with http://, https://, or www.
    final RegExp urlRegExp = RegExp(
      r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})',
      caseSensitive: false,
    );

    final List<InlineSpan> spans = [];
    int start = 0;

    // Find all URL matches within the string
    for (final RegExpMatch match in urlRegExp.allMatches(text)) {
      // Add plain text preceding the match
      if (match.start > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: textStyle ?? const TextStyle(),
          ),
        );
      }

      final String urlString = match.group(0)!;

      // Normalize URL (ensure it has a scheme for url_launcher)
      final String launchString = urlString.startsWith('www.')
          ? 'https://$urlString'
          : urlString;

      // Add the clickable URL text span
      spans.add(
        TextSpan(
          text: urlString,
          style: (linkStyle ?? const TextStyle()).copyWith(
            color: brandColor,
            decoration: TextDecoration.underline,
            decorationColor: brandColor,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final Uri uri = Uri.parse(launchString);
              if (!await launchUrl(uri)) {
                throw Exception('Could not launch $launchString');
              }
            },
        ),
      );

      start = match.end;
    }

    // Add any remaining plain text after the last match
    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: textStyle ?? const TextStyle(),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
