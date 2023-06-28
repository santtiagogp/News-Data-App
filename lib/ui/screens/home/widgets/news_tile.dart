import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.title,
    required this.description,
    required this.imgUrl
  });

  final String title;
  final String description;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
      
            SizedBox(
              height: 130,
              width: 130,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl,),
              ),
            ),

            const SizedBox( width: 20, ),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Text(
                    '${title.substring(0, 23)}...',
                    style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w600 ),
                  ),

                  Text(
                    description,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13
                    ),
                    maxLines: 5,
                  ),

                  const SizedBox( height: 20 ),
            
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            
                      Text('DD/MM/YYYY'),
            
                      Icon(Icons.bookmark_border)
            
                    ],
                  )
            
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}