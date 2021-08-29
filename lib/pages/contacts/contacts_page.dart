import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart' as anim;
import 'package:jorge_zaragoza_challenge/data/contacts_data.dart' as data;
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as utils;
import 'package:jorge_zaragoza_challenge/widgets/groupview_widget.dart';
import 'package:jorge_zaragoza_challenge/utils/custom_shape_border.dart';
import 'package:jorge_zaragoza_challenge/utils/search_data_delegate.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarContacts(context),
      body: GroupView(
        header: _buildHeaderList(context, 'assets/ikon_header.jpg'),
        items: data.contactsData,
        footer: _buildFooterList(context, 'End of contact list'),
      ),
    );
  }

  /// Create Appbar with action to search data
  AppBar _buildAppBarContacts(BuildContext context) {
    return AppBar(
      title: const Text(
        'Flutter Challenge',
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      shape: CustomShapeBorder(context),
      leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            'assets/ikon_logo.png',
            color: Theme.of(context).accentColor,
          )),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchDataDelegate(data: data.contactsData),
            );
          },
        ),
      ],
    );
  }

  /// Create a Widget to display as a header
  anim.FadeInDown _buildHeaderList(BuildContext context, String image) {
    return anim.FadeInDown(
      child: Container(
        margin: const EdgeInsets.all(utils.pading16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: utils.card_shadow,
        ),
        height: utils.getScreenHeight(context) * 0.15,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// Create a Widget to display as a footer
  Container _buildFooterList(BuildContext context, String text) {
    return Container(
      height: utils.getScreenHeight(context) * 0.05,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
