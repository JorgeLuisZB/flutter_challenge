import 'package:flutter/material.dart';

/// Design of the header group
class ListItemHeaderWidget extends StatelessWidget {
  final String title;

  const ListItemHeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      );
}
