import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:test_animations/description.dart';
import 'animations/staggered_animation/flutter_staggered_animations.dart';

class TabFirst extends StatelessWidget {
  final bool previous;
  const TabFirst({Key key, this.previous = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: 10 /*snapShot.data.length*/,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: 2,
            position: index,
            child: SlideAnimation(
              horizontalOffset: previous ? -250 : 250,
              duration: Duration(milliseconds: 600),
              delay: Duration(milliseconds: 150),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Description(
                              index: index,
                            ))),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  constraints: BoxConstraints.expand(),
                  child: Hero(
                    tag: "$index",
                    child: LCard(
                      elevation: 4.0,
                      image: LCardImage(
                          image: NetworkImage(
                              'https://picsum.photos/seed/picsum/200/300')),
                      body: LCardBody(
                        title: 'Heading',
                        subTitle: 'subtitle',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
