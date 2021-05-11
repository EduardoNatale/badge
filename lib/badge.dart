import 'dart:ui';

import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  final double circleSize;
  final double horizontalPadding;
  final double verticalPadding;
  final String text;
  final double radius;

  Badge({
    Key key,
    this.circleSize = 20,
    this.horizontalPadding = 12,
    this.verticalPadding = 8,
    this.radius = 12,
    @required this.text,
  }) : super(key: key);

  @override
  _BadgeState createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
      builder: (_, t, __) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned.fill(
                child: LayoutBuilder(builder: (context, constraint) {
                  return Padding(
                    padding: EdgeInsets.only(left: lerpDouble(widget.horizontalPadding, 0, t)),
                    child: OverflowBox(
                      maxHeight: lerpDouble(widget.circleSize, constraint.maxHeight, t),
                      maxWidth: lerpDouble(widget.circleSize, constraint.maxWidth, t),
                      minHeight: widget.circleSize,
                      minWidth: widget.circleSize,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(lerpDouble(widget.circleSize / 2, widget.radius, t)),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Positioned(
                right: 8,
                child: Transform.scale(
                  scale: lerpDouble(0, 1, t),
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.blue,
                      child: Icon(
                        Icons.close,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  lerpDouble(widget.circleSize + widget.horizontalPadding, widget.horizontalPadding, t),
                  widget.verticalPadding,
                  lerpDouble(widget.horizontalPadding, widget.circleSize + widget.horizontalPadding, t),
                  widget.verticalPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                  border: Border.all(),
                ),
                child: Text(widget.text),
              ),
            ],
          ),
        );
      },
    );
  }
}
