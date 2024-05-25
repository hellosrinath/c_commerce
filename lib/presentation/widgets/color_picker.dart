
import 'package:flutter/material.dart';

class ColorPickers extends StatefulWidget {
  const ColorPickers({
    super.key,
    required this.colors,
    required this.onChange,
  });

  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorPickers> createState() => _ColorPickersState();
}

class _ColorPickersState extends State<ColorPickers> {
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: widget.colors.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectedColor = index;
              widget.onChange(widget.colors[index]);
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: widget.colors[index],
              child: _selectedColor == index
                  ? const Icon(
                Icons.check,
                color: Colors.white,
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}