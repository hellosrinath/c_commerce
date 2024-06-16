import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishButton extends StatefulWidget {
  const WishButton({
    super.key,
    this.showAddToWishList = false,
    this.isSelected = false,
    required this.onTap,
  });

  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<WishButton> createState() => _WishButtonState();
}

class _WishButtonState extends State<WishButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showAddToWishList,
      replacement: _getIconButton(Icons.delete),
      child:
          InkWell(onTap: widget.onTap, child: _getIconButton(_getIconData())),
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

  IconData _getIconData() {
    return widget.isSelected ? Icons.favorite : Icons.favorite_outline_rounded;
  }
}
