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

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
    
          Align(
            alignment: Alignment.center,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
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

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis
                ),
                maxLines: 1,
              ),
            ),
          )

        ],
      ),
    );
  }
}