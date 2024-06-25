import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String img;
  String title;
  String desc;

  CategoryCard(
      {super.key, required this.img, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 12,
        color: const Color.fromARGB(255, 55, 51, 68),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
