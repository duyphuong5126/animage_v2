import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/feature/settings/setting_cubit.dart';
import 'package:animage/feature/settings/setting_state.dart';
import 'package:animage/shared/widgets/removable_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/url_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: space1),
        child: Column(
          spacing: space3,
          children: [
            const _GeneralInfoSection(),
            const _ContactInfoSection(),
            const _SuggestedTags(),
          ],
        ),
      ),
    );
    return BlocProvider(
      create: (context) => SettingCubit()..init(),
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(middle: Text('About')),
              child: body,
            )
          : Scaffold(
              appBar: AppBar(title: Text('About')),
              body: body,
            ),
    );
  }
}

class _GeneralInfoSection extends StatelessWidget {
  const _GeneralInfoSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, SettingState state) {
        return switch (state) {
          SettingInitialState() => const SizedBox.shrink(),
          SettingInitializedState() => _Section(
            title: 'General Info',
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: space1,
              children: _widgetsWithDividers([
                _InfoItem(title: 'About this app', description: state.appName),
                _InfoItem(title: 'Version', description: state.appVersion),
              ]),
            ),
          ),
        };
      },
    );
  }
}

class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Contact',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: space1,
        children: _widgetsWithDividers([
          _ExternalInfoItem(
            title: 'Twitter (X)',
            description: '@nonoka5126',
            onTap: () {
              openUrl('https://twitter.com/nonoka5126');
            },
          ),
          BlocBuilder<SettingCubit, SettingState>(
            builder: (context, SettingState state) {
              final versionTag = state is SettingInitializedState
                  ? '[${state.appVersion}]'
                  : '';
              final appNameTag = state is SettingInitializedState
                  ? '[${state.appName}]'
                  : '';
              return _ExternalInfoItem(
                title: 'Email',
                description: 'nonoka9002@gmail.com',
                onTap: () {
                  openEmail(
                    address: 'nonoka9002@gmail.com',
                    subject: '$appNameTag${versionTag}Request for support',
                    body: 'What happened:\n\nSteps to reproduce:\n\nOther info:\n\n',
                  );
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}

class _SuggestedTags extends StatelessWidget {
  const _SuggestedTags();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: space1),
          child: Text('Have fun', style: textTheme.headlineSmall),
        ),
        Container(
          margin: const EdgeInsets.only(top: spaceQuarter),
          padding: const EdgeInsets.symmetric(
            vertical: space1,
            horizontal: space1,
          ),
          width: double.infinity,
          child: Wrap(
            spacing: space1,
            runSpacing: spaceHalf,
            children: [
              for (final level in GalleryLevel.values)
                RemovableChip(
                  label: level.value,
                  bgColor: brandColor,
                  textColor: white,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: space1),
          child: Text(title, style: textTheme.headlineSmall),
        ),
        Container(
          margin: const EdgeInsets.only(top: spaceQuarter),
          padding: const EdgeInsets.symmetric(
            vertical: space1,
            horizontal: space2,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(space1)),
            color: grey217,
          ),
          child: body,
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.bodyLarge),
        const SizedBox(height: spaceQuarter),
        Text(description, style: textTheme.bodyMedium),
        const SizedBox(height: spaceQuarter),
      ],
    );
  }
}

class _ExternalInfoItem extends StatelessWidget {
  const _ExternalInfoItem({
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.bodyLarge),
                const SizedBox(height: spaceQuarter),
                Text(description, style: textTheme.labelSmall),
                const SizedBox(height: spaceQuarter),
              ],
            ),
          ),
          const SizedBox(width: spaceQuarter),
          const Icon(Icons.open_in_new, size: space2),
        ],
      ),
    );
  }
}

List<Widget> _widgetsWithDividers(Iterable<Widget> widgets) {
  List<Widget> result = [];
  int widgetCount = widgets.length;
  for (int index = 0; index < widgetCount; index++) {
    result.add(widgets.elementAt(index));
    if (index < widgetCount - 1) {
      result.add(const _InfoSectionDivider());
    }
  }
  return result;
}

class _InfoSectionDivider extends StatelessWidget {
  const _InfoSectionDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spaceHalf),
      child: Divider(height: 1, color: grey87),
    );
  }
}
