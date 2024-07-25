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
    this.children = const [],
    this.vertical = false,
    this.repeat = 4,
    this.duration = const Duration(seconds: 100),
    this.gap = 16.0,
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
    _animationController = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        if (_scrollController.hasClients) {
          final position = _scrollController.position;
          final newValue = position.maxScrollExtent * _animationController.value;
          if (_scrollController.position.pixels != newValue) {
            _scrollController.jumpTo(newValue);
          }
        }
      });
    _animationController.repeat();
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
