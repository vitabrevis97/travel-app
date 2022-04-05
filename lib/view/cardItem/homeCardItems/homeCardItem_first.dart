import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/routes/nab_bar_routes/homePage.dart';

class HomeCardItemFirst extends StatelessWidget {
  final CardItem item;

  const HomeCardItemFirst({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(
        children: [Image.asset(item.urlImage), Text(item.title)],
      ),
    );
  }
}
