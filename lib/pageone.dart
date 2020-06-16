import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_ui/liquid_ui.dart';

class PageOne extends StatefulWidget {
  final Color color;
  final PageController controller;
  const PageOne({Key key, this.color, this.controller}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
  AnimationController controller;
  TweenSequenceItem<Offset> start, end;
  ScrollDirection direction = ScrollDirection.forward;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    setForwardTween();

    widget.controller.addListener(animate);
  }

  void setForwardTween() {
    setState(() {
      start = TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset.zero, end: Offset(40.0, 0.0)),
        weight: 0.5,
      );

      end = TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset(40.0, 0.0), end: Offset(0.0, 0.0)),
        weight: 0.5,
      );
    });
  }

  void setBackwardTween() {
    setState(() {
      start = TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset.zero, end: Offset(-40.0, 0.0)),
        weight: 0.5,
      );

      end = TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset(-40.0, 0.0), end: Offset(0.0, 0.0)),
        weight: 0.5,
      );
    });
  }

  void animate() {
    if (!mounted) return;

    if (widget.controller.position.userScrollDirection != direction) {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setBackwardTween();
        controller.forward(from: 0.0);
      } else {
        setForwardTween();
        controller.reverse(from: 1.0);
      }
      setState(() {
        direction = widget.controller.position.userScrollDirection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(40.0),
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      children: List.generate(6, (index) {
        return AnimatedCard(
          color: widget.color,
          controller: controller,
          start: start,
          end: end,
        );
      }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedCard extends AnimatedWidget {
  final Color color;
  final TweenSequenceItem<Offset> start, end;

  AnimatedCard({
    Key key,
    AnimationController controller,
    this.color,
    this.start,
    this.end,
  }) : super(key: key, listenable: controller);

  Animation<Offset> get _progress => TweenSequence([start, end])
      .animate(CurvedAnimation(curve: Curves.ease, parent: listenable));

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _progress.value,
      child: LCard(
        color: color,
        elevation: 5.0,
        image: LCardImage(
            image: NetworkImage('https://picsum.photos/seed/nature/200/300')),
        body: LCardBody(
          title: 'Nature',
          subTitle: 'random',
        ),
      ),
    );
  }
}
