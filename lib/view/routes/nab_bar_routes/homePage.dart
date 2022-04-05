import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/utils/app_navigator.dart';
import 'package:flutter_application_2/view/cardItem/homeCardItems/homeCardItem_first.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Drawer(), //SEE THRU APP BAR
      appBar: AppBar(
        title: const Text('transtapernt app bar'),
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), //SEARCH BAR
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

//SEARCH BAR
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Bannana',
    'watermelon',
    'melon',
    'strawberry',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
//SEARCH BAR END

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _Body();
}

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.urlImage,
    required this.title,
    required this.subtitle,
  });
}

void _navigateTo() {
  Navigator.of(AppNavigator.context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => Body(),
    ),
  );
}

class _Body extends State<Body> {
  List<CardItem> items = [
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'thai',
      subtitle: '200',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'thai',
      subtitle: '200',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'thai',
      subtitle: '200',
    ),
    const CardItem(
      urlImage: 'assets/thai.jpg',
      title: 'thai',
      subtitle: '200',
    ),
  ];

  List<String> imageList = [
    'assets/thai.jpg',
    'assets/thai.jpg',
    'assets/thai.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        CarouselSlider(
          items: imageList
              .map((e) => ClipRRect(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          e,
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Text(e)
                      ],
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            height: 300,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text('Hot places'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            //kad koristis list View moras ga wrap-at s Containerom koji ima height inace ce zauceti cijelu visinu
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) => cardBuild(item: items[index]),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            //kad koristis list View moras ga wrap-at s Containerom koji ima height inace ce zauceti cijelu visinu
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) => cardBuildSecond(),
          ),
        ),
      ],
    );
  }

  Widget cardBuild({
    required CardItem item,
  }) =>
      SizedBox(
        width: 300,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeCardItemFirst(item: item)),
                );
              },
              child: Image.asset(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(top: 50, left: 150, child: Text(item.title)),
            Text(item.subtitle)
          ],
        ),
      );

  Widget cardBuildSecond() => SizedBox(
        width: 200,
        height: 200,
        child: Image.asset('assets/thai.jpg'),
      );
}
