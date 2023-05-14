import 'package:flutter/material.dart';

import '../models/category_model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category category;

  const HeroCarouselCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(category.imageUrl,
                  fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    category.name,
                    style:
                        // const TextStyle(
                        //   color: Colors.white,
                        //   fontSize: 20.0,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                            ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
