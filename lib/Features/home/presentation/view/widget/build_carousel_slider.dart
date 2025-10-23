import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/model/carousel_slider.dart';

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({super.key});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  final List<CarouselSliderModel> list = [
    CarouselSliderModel(image: const AssetImage("assets/images/carousel_slider_1.png")),
    CarouselSliderModel(image: const AssetImage("assets/images/carousel_slider_2.png")),
    CarouselSliderModel(image: const AssetImage("assets/images/carousel_slider_3.png")),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: list.map((item) => Image(
            image: item.image,
            width: double.infinity,
            fit: BoxFit.fill,
          )).toList(),
          options: CarouselOptions(
            height: 230.0,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(list.length, (index) {
              return Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.blue
                      : Colors.white.withOpacity(0.4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
