import 'package:flutter/material.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function? onRatingChanged;
  final Color color;
  final double iconSize;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
    this.onRatingChanged,
    this.color = Colors.amberAccent,
    this.iconSize = 20,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.starCount,
        (index) => buildStar(context, index),
      ),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= widget.rating) {
      icon = Icon(
        Icons.star_border,
        color: context.colorScheme.inversePrimary,
        size: widget.iconSize,
      );
    } else if (index > widget.rating - 1 && index < widget.rating) {
      icon = Icon(Icons.star_half, color: widget.color, size: widget.iconSize);
    } else {
      icon = Icon(Icons.star, color: widget.color, size: widget.iconSize);
    }

    return InkResponse(
      onTap: widget.onRatingChanged == null
          ? null
          : () => widget.onRatingChanged!(index + 1.0),
      child: icon,
    );
  }
}
