import 'dart:async';
import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/domain/entity/tag.dart';
import 'package:animage/feature/tag/tag_list_cubit.dart';
import 'package:animage/feature/tag/tag_list_state.dart';
import 'package:animage/shared/extension/context_extension.dart';
import 'package:animage/shared/helper/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagList extends StatefulWidget {
  const TagList({super.key, required this.tagQuery, required this.onSelectTag});

  final String tagQuery;
  final Function(Tag) onSelectTag;

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final TagListCubit _cubit = TagListCubit();

  @override
  void initState() {
    super.initState();
    _cubit.updateQuery(widget.tagQuery);
  }

  @override
  void didUpdateWidget(covariant TagList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tagQuery != widget.tagQuery) {
      unawaited(_cubit.updateQuery(widget.tagQuery));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<TagListCubit, TagListState>(
        builder: (context, state) {
          return Container(
            color: context.themedValue(white, black),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final tag = state.tags[index];
                return GestureDetector(
                  onTap: () {
                    widget.onSelectTag(tag);
                  },
                  child: _TagItem(tag: tag, highlightedText: widget.tagQuery),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: space1),
                  child: Divider(height: 1),
                );
              },
              itemCount: state.tags.length,
            ),
          );
        },
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  const _TagItem({required this.tag, required this.highlightedText});

  final Tag tag;
  final String highlightedText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: space2, vertical: space1),
      child: Column(
        spacing: space1,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(tag.name, style: _tagNameTextStyle(context)),
          ),
          Text(
            postCountFormat.format(tag.count),
            style: _tagCountTextStyle(context),
          ),
        ],
      ),
    );
  }

  TextStyle? _tagNameTextStyle(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTheme.of(context).textTheme.textStyle
        : Theme.of(context).textTheme.bodyLarge;
  }

  TextStyle? _tagCountTextStyle(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTheme.of(context).textTheme.tabLabelTextStyle
        : Theme.of(context).textTheme.labelMedium;
  }
}
