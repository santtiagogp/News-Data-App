import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.25,
      width: size.width,
      child: CarouselSlider.builder(
        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center( child: Text('Index: $index') ),
          );
        },
        itemCount: 5,
        options: CarouselOptions(
          animateToClosest: true,
          autoPlay: true,
          autoPlayInterval: const Duration( seconds: 15 ),
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}