import 'dart:html' as html;

import 'package:flutter/material.dart';


class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();
  
  List<String> listPage = ["home", "about", "pricing", "contact", "location"];
  List<String> listNamePage = ["Home", "About", "Pricing", "Contact", "Location"];
  int currentPage = 0;

  createScrollController(String routerName){
    int index = getIndexPage(routerName);

    scrollController.addListener(() {
      final indexPageRound = (scrollController.page ?? 0).round();
      if(indexPageRound != currentPage){
        this.scrollController = new PageController(initialPage: index);
        html.document.title = listNamePage[index];
        currentPage = indexPageRound;
      }
    });

  }

  int getIndexPage(String routerName){
    return (listPage.indexOf(routerName) == -1) ? 0 : listPage.indexOf(routerName);
  }

  goTo(int index){
    //html.document.title = listNamePage[index];
    final routeName = listPage[index];
    html.window.history.pushState(null, routeName, "#/"+routeName);
    scrollController.animateToPage(
      index, 
      duration: Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }
} 