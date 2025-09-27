import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    required this.items,
    required this.height,
    super.key,
    this.onPageChange,
  });

  final List<Widget> items;
  final double height;
  final Function(int, CarouselPageChangedReason)? onPageChange;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: height,
        enlargeCenterPage: true,
        onPageChanged: onPageChange,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        viewportFraction: 1,
      ),
    );
  }
}
