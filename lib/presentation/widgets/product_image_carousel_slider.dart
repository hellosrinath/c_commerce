import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/cache_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedSliderIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCarouselSlider(),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: _buildDotIndicator(),
        ),
      ],
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedSliderIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.images.length; i++)
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 2 * 2),
                  decoration: BoxDecoration(
                    color:
                        i == currentPage ? AppColor.primaryColor : Colors.white,
                    border: Border.all(
                      color: i == currentPage
                          ? AppColor.primaryColor
                          : Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
            ],
          );
        });
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 220.0,
          viewportFraction: 1,
          onPageChanged: (index, _) {
            _selectedSliderIndex.value = index;
          }),
      items: widget.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: CacheNetworkImage(
                url: image,
                boxFit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
