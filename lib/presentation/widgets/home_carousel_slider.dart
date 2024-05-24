import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedSliderIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(height: 8),
        _buildDotIndicator(),
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
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 15,
                    height: 15,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: i == currentPage ? AppColor.primaryColor : null,
                      border: Border.all(
                        color: i == currentPage
                            ? AppColor.primaryColor
                            : Colors.grey,
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
            height: 180.0,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              _selectedSliderIndex.value = index;
            }),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      );
  }
}
