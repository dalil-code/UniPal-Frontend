import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry padding;

  const ScrollableColumn({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.padding = EdgeInsets.zero,
    this.textBaseline,
    this.textDirection,
    this.physics,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      const SizedBox(width: double.infinity),
      ...this.children,
    ];

    return LayoutBuilder(
      builder: (context, constraint) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            physics: physics,
            child: Padding(
              padding: padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight - padding.vertical,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    verticalDirection: verticalDirection,
                    textBaseline: textBaseline,
                    textDirection: textDirection,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
