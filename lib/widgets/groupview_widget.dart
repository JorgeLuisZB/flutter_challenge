import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:jorge_zaragoza_challenge/model/section_model.dart';
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as utils;
import 'package:jorge_zaragoza_challenge/widgets/list_item_header_widget.dart';
import 'package:jorge_zaragoza_challenge/widgets/list_item_widget.dart';

/// Create a Widget with header, items, and footer.
///
/// header is optional
/// items is required
/// footer is optional
class GroupView extends StatelessWidget {
  final Widget? header;
  final List<String> items;
  final Widget? footer;

  const GroupView({Key? key, this.header, required this.items, this.footer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SectionModel> listOfSections = utils.groupByCharacter(items);

    return CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.only(top: 30)),
      _buildGenericTag(header),
      ...listOfSections
          .map(
            (newsSection) => SliverPadding(
              padding: EdgeInsets.all(utils.pading16).copyWith(top: 0),
              sliver: MultiSliver(
                pushPinnedChildren: true,
                children: [
                  _buildSectionHeader(context, newsSection),
                ],
              ),
            ),
          )
          .toList(),
      _buildGenericTag(footer),
      SliverPadding(padding: const EdgeInsets.only(bottom: 30)),
    ]);
  }

  /// Display header or footer of the list
  Widget _buildGenericTag(Widget? tag) {
    return SliverToBoxAdapter(child: tag);
  }

  /// Display the header of each group
  Widget _buildSectionHeader(BuildContext context, SectionModel section) =>
      MultiSliver(
        children: <Widget>[
          SliverPinnedHeader(child: ListItemHeaderWidget(title: section.title)),
          SliverClip(
            child: MultiSliver(
              children: <Widget>[
                _buildSectionDataList(section),
              ],
            ),
          ),
        ],
      );

  /// Display the list of the data in each group
  Widget _buildSectionDataList(SectionModel section) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListItemWidget(text: section.data[index]),
          childCount: section.data.length,
        ),
      );
}
