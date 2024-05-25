
import 'package:flutter/material.dart';

class SizePickers extends StatefulWidget {
  const SizePickers({
    super.key,
    required this.sizes,
    required this.onChange,
  });

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePickers> createState() => _SizePickersState();
}

class _SizePickersState extends State<SizePickers> {
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: widget.sizes.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectedColor = index;
              widget.onChange(widget.sizes[index]);
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
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