import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import '/model/hit_model.dart';

class HitsImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final List<Hits> imageUrls;

  HitsImageProvider({required this.imageUrls, this.initialIndex = 0}) : super();

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    return NetworkImage(imageUrls[index].largeImageURL!);
  }

  @override
  int get imageCount => imageUrls.length;
}