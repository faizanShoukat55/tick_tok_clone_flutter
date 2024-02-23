import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tick_tok/utils/images_provider.dart';

import '../../../models/slider_model.dart';

class OnBoardController extends GetxController{
  PageController? pageController=PageController();
  List<SliderModel> mySlides = <SliderModel>[];

  var slideIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    mySlides=getSlides();
  }

  void onPageChange(int index){
    slideIndex.value=index;
  }
  List<SliderModel> getSlides() {
    List<SliderModel> slides = <SliderModel>[];
    SliderModel sliderModel = SliderModel();

    //1
    sliderModel.setDesc(
        "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!");
    sliderModel.setTitle("Discover Great Deals");
    sliderModel.setImageAssetPath(ImagesPath.slider1);
    slides.add(sliderModel);

    sliderModel = SliderModel();

    //2
    sliderModel.setDesc(
        "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!");
    sliderModel.setTitle("Effortless Selling");
    sliderModel.setImageAssetPath(ImagesPath.slider2);
    slides.add(sliderModel);

    sliderModel = SliderModel();

    //3
    sliderModel.setDesc(
        "Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,");
    sliderModel.setTitle("Promote Your Business");
    sliderModel.setImageAssetPath(ImagesPath.slider3);
    slides.add(sliderModel);

    sliderModel = SliderModel();

    return slides;
  }
}