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

    final size = MediaQuery.of(context).size;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
    
            Container(
              width: size.height * 0.15,
              height: size.height * 0.15,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imgUrl, fit: BoxFit.cover)
              ),
            ),
    
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                Container(
                  margin: const EdgeInsets.symmetric( vertical: 10 ),
                  width: size.width * 0.5,
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                    ),
                  ),
                ),
    
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                              
                      Text(
                        formatDate(date)
                      ),
                              
                      const Icon(
                        Icons.bookmark_border
                      )
                              
                    ],
                  ),
                )
    
              ],
            )
    
          ],
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

}