import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

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
        child: const Row(
          children: [
      
            SizedBox(
              height: 150,
              width: 150,
              child: Placeholder(),
            ),

            SizedBox( width: 20, ),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Text(
                    'Title',
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600 ),
                  ),

                  Text(
                    'Laboris mollit pariatur aliqua minim. Dolor est nostrud ex irure pariatur. In aute nostrud est duis. Do anim adipisicing sint irure in quis amet consequat.',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13
                    ),
                    maxLines: 5,
                  ),

                  SizedBox( height: 20 ),
            
                  Row(
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