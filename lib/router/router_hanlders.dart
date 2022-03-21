import 'package:fluro/fluro.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final HomeHandler = Handler(
  handlerFunc: (context, parameters) {
    final String page = parameters["page"]!.first;
    print("==> " + page);
    if(page != "/"){
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);
      pageProvider.createScrollController(page);
      return HomePage();
    }
  }
);