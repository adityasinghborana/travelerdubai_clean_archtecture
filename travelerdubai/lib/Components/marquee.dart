import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Marquee extends StatefulWidget {
  final bool reverse;
  final bool pauseOnHover;
  final List<Widget> children;
  final bool vertical;
  final int repeat;
  final Duration duration;
  final double gap;

  const Marquee({
    Key? key,
    this.reverse = false,
    this.pauseOnHover = false,
    this.children =  const [

    ],
    this.vertical = false,
    this.repeat = 4,
    this.duration = const Duration(seconds: 100), // Reduced duration for testing
    this.gap = 16.0, required ,
  }) : super(key: key);

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this, duration: widget.duration);

    _animationController.addListener(() {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent * _animationController.value);
    });

    if (!widget.pauseOnHover) {
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.pauseOnHover) _animationController.stop();
      },
      onExit: (_) {
        if (widget.pauseOnHover) _animationController.repeat();
      },
      child: SingleChildScrollView(
        scrollDirection: widget.vertical ? Axis.vertical : Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: List.generate(widget.repeat, (index) {
            return Container(
              margin: widget.vertical
                  ? EdgeInsets.symmetric(vertical: widget.gap)
                  : EdgeInsets.symmetric(horizontal: widget.gap),
              child: Column(
                children: widget.children,
              ),
            );
          }),
        ),
      ),
    );
  }
}


