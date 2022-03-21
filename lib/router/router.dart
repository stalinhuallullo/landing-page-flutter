import 'package:fluro/fluro.dart';
import 'package:landing_page/router/router_hanlders.dart';

class Flurorouter{
  static final FluroRouter router = new FluroRouter();

  static void configureRouter() {
    router.define("/:page", handler: HomeHandler);

    router.notFoundHandler = HomeHandler;
  }
}