import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPress;
  final int buttoncolor;
  final int textColor;
  final bool check;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPress,
    required this.buttoncolor,
    required this.textColor, required this.check,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.25,
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(buttoncolor), borderRadius: BorderRadius.circular(5)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(label,
              textAlign: TextAlign.center,

              /// overflow: TextOverflow.visible,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins")),
        ]),
      ),
    );
  }
}