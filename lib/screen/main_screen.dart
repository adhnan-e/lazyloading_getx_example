import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '/controller/main_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shimmer/shimmer.dart';
import '../provider/hits_image_provider.dart';

class MainScreen extends StatelessWidget {
  final _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: TextField(
                    focusNode: FocusNode(),
                    enableInteractiveSelection: false,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      hintText: 'Search here ',
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: const Icon(
                        Icons.close,
                      ),
                    ),
                    onSubmitted: (value) => _controller.search(value),
                  ),
                ),
              ),
              Flexible(
                child:_controller.isError?Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/warnning.png",colorBlendMode: BlendMode.colorBurn,),

                    const Text("Oops!, Some thing went wrong")
                  ],
                ):_controller.isNoImage?Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/void.png",colorBlendMode: BlendMode.colorBurn,),

                    const Text("No Image Found!")
                  ],
                ): LazyLoadScrollView(
                  onEndOfPage: _controller.loadNextPage,
                  isLoading: _controller.lastPage,
                  child:_controller.hists.isNotEmpty ? MasonryGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    itemCount: _controller.hists.length,
                    itemBuilder: (context, index) {
                      final image = _controller.hists[index];
                      return InkWell(
                        onTap: () {
                          showImageViewerPager(
                              context,
                              HitsImageProvider(
                                  imageUrls: _controller.hists,
                                  initialIndex: index),
                              useSafeArea: false,
                              immersive: false);
                        },
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: image.largeImageURL!,
                              placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    color: Colors.white,
                                    width: 200.0,
                                    height: 100.0,
                                  )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            Text(image.user!.toUpperCase())
                          ],
                        ),
                      );
                    },
                  ):const Center(child: CircularProgressIndicator(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
