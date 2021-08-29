import 'package:flutter/material.dart';

/// Design of each item in the group
class ListItemWidget extends StatelessWidget {
  final String text;

  const ListItemWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: text,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: Image.asset(
            'assets/placeholder_user.png',
            fit: BoxFit.cover,
            height: 28,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ),
      title: Text(text),
      onTap: () =>
          Navigator.pushNamed(context, 'contacts/detail', arguments: text),
    );
  }
}
