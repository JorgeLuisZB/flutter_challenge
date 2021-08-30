import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:jorge_zaragoza_challenge/provider/data_provider.dart';
import 'package:jorge_zaragoza_challenge/model/section_model.dart';
import 'package:jorge_zaragoza_challenge/widgets/list_item_header_widget.dart';
import 'package:jorge_zaragoza_challenge/widgets/list_item_widget.dart';
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as utils;

/// Create a Widget with items grouped by the first letter.
class GroupView extends StatelessWidget {
  final List<String> items;

  const GroupView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);

    return CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.only(top: 50)),
      ...provider.initialSections
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
      SliverPadding(padding: const EdgeInsets.only(top: 50)),
    ]);
  }

  /// Display the header of each group
  Widget _buildSectionHeader(BuildContext context, SectionModel section) {
    return MultiSliver(
      children: <Widget>[
        SliverPinnedHeader(child: ListItemHeaderWidget(title: section.title)),
        SliverClip(
          child: MultiSliver(
            children: <Widget>[
              _buildSectionDataList(section),
              SliverToBoxAdapter(child: _buildFooterSeeMore(context, section)),
            ],
          ),
        ),
      ],
    );
  }

  /// Display the list of the data in each group
  Widget _buildSectionDataList(SectionModel section) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            ListItemWidget(index: index, text: section.data[index]),
        childCount: section.data.length,
      ),
    );
  }

  Widget _buildFooterSeeMore(BuildContext context, SectionModel section) {
    final bool loading = section.isLoading;

    return !section.isComplete
        ? Container(
            height: 64,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: loading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      child: Text(
                        'See More',
                      ),
                      onPressed: () {
                        final provider =
                            Provider.of<DataProvider>(context, listen: false);

                        provider.fetchMoreSections(section);
                      },
                    ),
            ),
          )
        : Container();
  }
}
