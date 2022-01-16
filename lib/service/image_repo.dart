import 'dart:convert';

import '/constant/app_config.dart';
import '/constant/http_service.dart';
import '/model/image_filter_model.dart';
import '/model/image_model.dart';

 class ImageRepository {
  HttpService httpService = HttpService();

   Future<ImageModel> getImages(ImageFilterModel filter) async {
     final response = await httpService.getRequest("${AppConfig.BASE_URL}?image_type=photo&key=${AppConfig.pixabayAPIkey}&page=${filter.page}&q=${filter.quarry}");
     return imageModelFromJson(json.decode(response.body));


  }
}
