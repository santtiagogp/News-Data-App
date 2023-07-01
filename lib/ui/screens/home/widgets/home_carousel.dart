import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/news_model.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
    required this.news
  });

  final List<News> news;

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
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image(
              image: NetworkImage( news[index].imageUrl ),
            ),
          );
        },
        itemCount: news.length,
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