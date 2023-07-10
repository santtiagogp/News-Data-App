import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    
  });

  final Widget Function(BuildContext, int, int)? itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {

    return CarouselSlider.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      options: CarouselOptions(
        animateToClosest: true,
        autoPlay: true,
        autoPlayInterval: const Duration( seconds: 15 ),
        enlargeCenterPage: true,
      ),
    );
  }
}