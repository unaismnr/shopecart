import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBannerSlider extends StatelessWidget {
  HomeBannerSlider({super.key});

  final List<String> images = [
    'assets/Images/slide-01.jpg',
    'assets/Images/slide-02.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 150,
          viewportFraction: .8,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
        ),
        items: images.map((e) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    ]);
  }
}
