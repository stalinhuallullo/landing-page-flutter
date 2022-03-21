import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {

  final String text;
  final Function onPresed;

  const CustomMenuItem({ 
    Key? key,
    required this.text,
    required this.onPresed
  }) : super(key: key);

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: MouseRegion(
        onEnter: ( _ ) => setState(() => isHover = true),
        onExit: ( _ ) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPresed(),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.black,
            child: Center(
              child: Text(widget.text, style: GoogleFonts.roboto(fontSize: 20, color: Colors.white ),),
            ),
          ),
        ),
      ),
    );
  }
}