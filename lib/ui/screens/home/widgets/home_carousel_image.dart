import 'package:flutter/material.dart';

class HomeCarouselImage extends StatelessWidget {
  const HomeCarouselImage({
    super.key,
    required this.imageUrl,
    required this.title
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
    
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
    
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black
                ],
                stops: [
                  0.4,
                  1
                ]
              )
            ),
          ),

          Positioned(
            bottom: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                overflow: TextOverflow.ellipsis
              ),
              maxLines: 1,
            ),
          )

        ],
      ),
    );
  }
}