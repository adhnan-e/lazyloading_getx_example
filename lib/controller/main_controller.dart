import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/model/image_model.dart';
import '/model/image_filter_model.dart';
import '/service/image_repo.dart';

import '../model/hit_model.dart';

class MainController extends GetxController {
  final ImageRepository _imageRepository = ImageRepository();
  final _hists = <Hits>[].obs;
  final _imageFilter = ImageFilterModel().obs;
  final _lastPage = false.obs;
  String quarry = "cool";
  bool isNoImage=false;
  bool isError=false;

  int get _page => _imageFilter.value.page!;

  bool get lastPage => _lastPage.value;

  List<Hits> get hists => _hists;

  @override
  void onInit() {
    ever(_imageFilter, (_) => _getAllUsers());
    changePaginationFilter(1, quarry);
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void onReady() {}


  Future<void> _getAllUsers() async {

    final ImageModel userData;
    try {
      userData = await _imageRepository.getImages(_imageFilter.value);

      if (kDebugMode) {
        print(userData);
      }
      if (userData.hits!.isEmpty) {
        _lastPage.value = true;
      }
      _hists.addAll(userData.hits!);
      if (_hists.isEmpty) {
        isNoImage = true;
      } else {
        isNoImage = false;
      }
      isError=false;
    }catch(e){
      isError=true;
      Get.snackbar("Oops!", "Something went wrong.");
    }
  }

  void changePaginationFilter(int page, String quarry) {
    _imageFilter.update((val) {
      val!.page = page;
      val.quarry = quarry;
    });
  }

  void loadNextPage() => changePaginationFilter(_page + 1, quarry);

  void loadSearch(String quarry) {
    _hists.clear();
    changePaginationFilter(1, quarry);
  }

}
