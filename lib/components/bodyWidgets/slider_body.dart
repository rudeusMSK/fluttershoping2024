import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "http://backendflutter2024.somee.com/public/imgs/G2.png",
  "http://backendflutter2024.somee.com/public/imgs/G1.png",
  "http://backendflutter2024.somee.com/public/imgs/G2.png",
  "http://backendflutter2024.somee.com/public/imgs/G3.png",
  "http://backendflutter2024.somee.com/public/imgs/G4.png",
  "http://backendflutter2024.somee.com/public/imgs/B1.png",
];

final themeMode = ValueNotifier(2);


final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                    '${imgList.indexOf(item)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ))
    .toList();


class EnlargeStrategyZoomDemo extends StatelessWidget {
  const EnlargeStrategyZoomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.4,
      ),
      items: imageSliders,
    );
  }
}
