import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/shared/custom_menu_item.dart';
import 'package:provider/provider.dart';


class CustomAppMenu extends StatefulWidget {
  CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}


class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin{

  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if(isOpen) controller.reverse();
          else controller.forward();

          setState(() {
            isOpen = !isOpen;
          });
        },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: isOpen ? 308 : 50,
            color: Colors.black,
            child: Column(
              children: [
                _MenuTitle(isOpen: isOpen, controller: controller),
                if(isOpen)...[
                  CustomMenuItem(text: "Home", onPresed: () => pageProvider.goTo(0)),
                  CustomMenuItem(text: "About", onPresed: () => pageProvider.goTo(1)),
                  CustomMenuItem(text: "Pricing", onPresed: () => pageProvider.goTo(2)),
                  CustomMenuItem(text: "Contact", onPresed: () => pageProvider.goTo(3)),
                  CustomMenuItem(text: "Location", onPresed: () => pageProvider.goTo(4)),
                  SizedBox(height: 8)
                ]
              ],
            )
        )
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text("Menú", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            color: Colors.white,
            progress: controller
          )
        ],
      ),
    );
  }
}