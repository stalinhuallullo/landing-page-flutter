import 'package:flutter/material.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/router/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PageProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Flurorouter.configureRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      initialRoute: "/home",
      onGenerateRoute: (routeSettings) => Flurorouter.router.generator(routeSettings),
    );
  }
}