import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_animations/descriptionclipper.dart';

class Description extends StatelessWidget {
  final int index;

  const Description({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: DescriptionClipper(),
                child: Hero(
                  tag: '$index',
                  child: Container(
                    height: 400.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: NetworkImage(
                              'https://picsum.photos/seed/picsum/200/300',
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Lottie.asset('assets/bike.json'),
          ),
        ],
      ),
    );
  }
}
