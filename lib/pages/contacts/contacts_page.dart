import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/data/contacts_data.dart' as data;
import 'package:jorge_zaragoza_challenge/widgets/groupview_widget.dart';
import 'package:jorge_zaragoza_challenge/utils/custom_shape_border.dart';
import 'package:jorge_zaragoza_challenge/utils/search_data_delegate.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarContacts(context),
      body: GroupView(items: data.contactsData),
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
}
