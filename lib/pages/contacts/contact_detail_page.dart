import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart' as anim;
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as utils;
import 'package:jorge_zaragoza_challenge/utils/custom_shape_border.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: _buildAppbarDetail(context),
      body: Container(
        height: utils.getScreenHeight(context),
        width: utils.getScreenWidth(context),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDataImage(context, args),
            _buildDataText(args),
          ],
        )),
      ),
    );
  }

  /// Create Appbar for contact datail page
  AppBar _buildAppbarDetail(BuildContext context) {
    return AppBar(
      title: const Text('Contact detail'),
      shape: CustomShapeBorder(context),
      centerTitle: true,
    );
  }

  /// Display default contact image
  Hero _buildDataImage(BuildContext context, String args) {
    return Hero(
      tag: args,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        maxRadius: 45,
        child: Image.asset(
          'assets/placeholder_user.png',
          fit: BoxFit.cover,
          height: 48,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }

  /// Display the data received from args
  anim.BounceInRight _buildDataText(String args) {
    return anim.BounceInRight(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          args.substring(0, args.length - 1),
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
