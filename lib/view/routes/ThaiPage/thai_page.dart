import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/routes/nab_bar_routes/route_one_navbar.dart';

class ThaiPage extends StatelessWidget {
  final CardItem item;

  const ThaiPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item.urlImage),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
        ),
        child: Text(item.title),
      ),
    );
  }
}
