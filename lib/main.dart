import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_navigator.dart';
import 'package:flutter_application_2/view/routes/nab_bar_routes/route_one_navbar.dart';
import 'package:flutter_application_2/view/routes/nab_bar_routes/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItemIndex = 0;
  final List pages = const [HomePage(), RouteOne(), null, null, null];

  static final Set<IconData> _icons = {
    Icons.home,
    Icons.explore,
    Icons.person,
    Icons.favorite,
    Icons.inbox,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (var i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedItemIndex = i;
                  });
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 8,
                  decoration: const BoxDecoration(),
                  child: Icon(
                    _icons.elementAt(i),
                    size: 28,
                    color:
                        i == _selectedItemIndex ? Colors.green : Colors.black,
                  ),
                ),
              ),
            )
        ],
      ),
      body: pages[_selectedItemIndex],
    );
  }
}
