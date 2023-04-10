import 'package:flutter/material.dart';

class GenderChoice extends StatefulWidget {
   GenderChoice( {Key? key, required this.genderType, required this.write,required this.clickColor})
      : super(key: key);
  final int genderType;
  static String gender='';
   Color clickColor;

  final bool write;

  @override
  State<GenderChoice> createState() => _GenderChoiceState();
}

class _GenderChoiceState extends State<GenderChoice> {
  final List<IconData> genderIcon = [Icons.female, Icons.male];



  @override
  Widget build(BuildContext context) {
    double ri = 7.5;
    double le = 7.5;
    if (widget.write) {
      ri += 7.5;
    } else {
      le += 7.5;
    }
    return Container(
      height: 180,
      margin: EdgeInsets.only(right: ri, top: 15, left: le, bottom: 15),
      //padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: widget.clickColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            genderIcon[widget.genderType],
            color: Colors.white,
            size: 80,
          ),
          Text(
            widget.genderType == 0 ? 'Female' : 'male',
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
