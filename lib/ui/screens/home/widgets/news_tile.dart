import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.date,
    required this.onTap
  });

  final String title;
  final String description;
  final String imgUrl;
  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
                height: 130,
                width: 180,
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
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
              
                        Text(formatDate(date)),
              
                        const Icon(Icons.bookmark_border)
              
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

  String formatDate( DateTime date ) {
    final DateFormat formatter = DateFormat();
    final String dateToString = formatter.format(date);
    final cutString = dateToString.substring(0, 12);
    return cutString;
  }

  String shortTitle( String title ) {

    String txt = title;

    if(txt.length < 10) {
      return txt;
    }

    return '${txt.substring(0, 15)}...';
  }

}