import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'hero_icons.dart';

class HeroIcon extends StatelessWidget {
  const HeroIcon(
    this.icon, {
    this.color,
    this.solid = false,
    this.size,
    Key? key,
  }) : super(key: key);

  final HeroIcons icon;
  final Color? color;
  final double? size;
  final bool? solid;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      color: color ?? IconTheme.of(context).color,
      height: size,
      width: size,
      alignment: Alignment.center,
    );
  }
}
