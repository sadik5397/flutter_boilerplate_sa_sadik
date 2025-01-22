import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl, this.hero});

  final String imageUrl;
  final String? hero;

  @override
  Widget build(BuildContext context) => Stack(
      alignment: Alignment.topCenter,
      children: [Hero(tag: hero ?? imageUrl, child: Container(decoration: BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.contain))))]);
}
