import 'dart:convert';

import 'hit_model.dart';


Future<ImageModel> imageModelFromJson(var str) async {
  return ImageModel.fromJson(str);
}

String imageModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
  String? total;
  String? totalHits;
  List<Hits>? hits;

  ImageModel(this.total, this.totalHits, this.hits);

  factory ImageModel.fromJson(var json) {
    Map<String, dynamic> mapName = Map<String, dynamic>.from(json);
    ImageModel imageModel= ImageModel(
       mapName['total'].toString(),
      mapName['totalHits'].toString(),
       List<Hits>.from(mapName["hits"].map((x) => Hits.fromJson(x))),
    );
    return imageModel;
  }

  Map<String, dynamic> toJson() =>
      {
        "total": total,
        "totalHits": totalHits,
        "hits": hits == null ? null : List<dynamic>.from(
            hits!.map((x) => x.toJson())),
      };
}
