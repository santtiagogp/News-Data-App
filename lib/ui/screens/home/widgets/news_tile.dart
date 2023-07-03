import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.onTap
  });

  final String title;
  final String description;
  final String imgUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                height: 180,
                width: 130,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl),
                ),
              ),
    
              const SizedBox( width: 20, ),
        
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              
                    Text(
                      shortTitle(title),
                      style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w600 ),
                    ),
    
                    Text(
                      description,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13
                      ),
                      maxLines: 4,
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
      ),
    );
  }

  String shortTitle( String title ) {

    String txt = title;

    if(txt.length < 10) {
      return txt;
    }

    return '${txt.substring(0, 15)}...';
  }

}