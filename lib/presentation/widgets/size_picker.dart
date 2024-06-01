import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickers extends StatefulWidget {
  const SizePickers({
    super.key,
    required this.sizes,
    required this.onChange,
    this.isRounded = true,
  });

  final List<String> sizes;
  final Function(String) onChange;
  final bool isRounded;

  @override
  State<SizePickers> createState() => _SizePickersState();
}

class _SizePickersState extends State<SizePickers> {
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
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
            child: Container(
              width: widget.isRounded ? 40 : null,
              height: 40,
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _getSelectedBackgroundColor(index == _selectedColor),
                borderRadius: BorderRadius.circular(widget.isRounded ? 100 : 8),
                border: Border.all(
                  color: _getSelectedTextColor(index == _selectedColor),
                ),
              ),
              child: FittedBox(
                child: Text(
                  widget.sizes[index],
                  style: TextStyle(
                      color: _getSelectedTextColor(index == _selectedColor)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getSelectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedBackgroundColor(bool isSelected) {
    return isSelected ? AppColor.primaryColor : Colors.transparent;
  }
}
