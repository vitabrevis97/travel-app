import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/routes/ThaiPage/thai_page.dart';

class RouteOne extends StatefulWidget {
  const RouteOne({Key? key}) : super(key: key);

  @override
  State<RouteOne> createState() => _RouteOneState();
}

class CardItem {
  final String urlImage;
  final String title;

  const CardItem({
    required this.urlImage,
    required this.title,
  });
}

class _RouteOneState extends State<RouteOne> {
  final _imageUrls = ['assets/thai.jpg', 'assets/thai.jpg', 'assets/thai.jpg'];
  List<String> images = ['assets/thai.jpg', 'assets/thai.jpg'];
  List<CardItem> items = [
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'Nike',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'puma',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'Nike',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'Nike',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'puma',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'Nike',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
            'https://www.fodors.com/wp-content/uploads/2018/10/HERO_UltimateRome_Hero_shutterstock789412159.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(Icons.hotel),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(Icons.flight),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(Icons.abc),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: [
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      buildCard(item: items[index]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ThaiPage(
                    item: item,
                  );
                }));
              },
              child: Container(
                child: Image.asset(
                  item.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                item.title,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          ],
        ),
      );
}
