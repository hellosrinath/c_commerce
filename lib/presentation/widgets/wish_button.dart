import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishButton extends StatefulWidget {
  const WishButton({super.key, this.showAddToWishList = false});

  final bool showAddToWishList;

  @override
  State<WishButton> createState() => _WishButtonState();
}

class _WishButtonState extends State<WishButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showAddToWishList,
      replacement: _getIconButton(Icons.delete),
      child: _getIconButton(Icons.favorite_border_outlined),
    );
  }

  Widget _getIconButton(IconData iconData) {
    return Card(
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          iconData,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
