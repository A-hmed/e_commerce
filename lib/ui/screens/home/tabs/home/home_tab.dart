import 'package:e_commerce/ui/screens/home/product_item.dart';
import 'package:e_commerce/ui/screens/home/tabs/home/home_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget {
  late double height;
  late double width;
  HomeViewModel viewModel = HomeViewModel();
  List<String> sliderImages = [
    'assets/images/slider_image.png',
    'assets/images/slider_image.png',
    'assets/images/slider_image.png'
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocConsumer(
      bloc: viewModel..getProducts()..getCategories(),
      listener: (context, state){
        if(state is HomeErrorState){
          showErrorDialog(context, state.message);
        }
      },
      builder: (context, state){
        if(state is HomeSuccessState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildImagesSlider(),
                buildCategoriesRow(),
                buildCategoriesSection(),
                buildProductsSection()
              ],
            ),
          );
        }else if(state is HomeLoadingState) {
         return Center(child: CircularProgressIndicator());
        }else {
          return SizedBox();
        }
      },
    );
  }

  Widget buildCategoriesRow(){
   return Padding(
     padding: EdgeInsets.all(12),
     child: Row(
       children: const [
         Text(
           "Categories",
           style: TextStyle(
               color: AppColors.primaryColor, fontSize: 16),
         ),
         Spacer(),
         Text("view all",
             style: TextStyle(
                 color: AppColors.primaryColor, fontSize: 12)),
       ],
     ),
   );
  }

  Widget buildProductsSection() {
    return Container(
      width: double.infinity,
      height: height*.32,
      padding: EdgeInsets.all(12),
      child: ListView.builder(
          itemCount: viewModel.products!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  ProductItem(viewModel.products![index]);
          },
      ),
    );
  }

  Widget buildCategoriesSection() {
    return Container(
      height: height *.3,
      padding: EdgeInsets.all(12),
      child: GridView.builder(
          itemCount: viewModel.categories!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 8 ,
                    child: CircleAvatar(
                      backgroundImage:NetworkImage(viewModel.categories![index].image??"")
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Text(
                       viewModel.categories![index].name??"",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          )),
    );
  }

  Widget buildImagesSlider() {
   return ImageSlideshow(
     width: double.infinity,
     height: height * .3,
     initialPage: 0,
     indicatorColor: AppColors.primaryColor,
     indicatorBackgroundColor: Colors.grey,
     children: sliderImages.map((url) => Padding(
       padding: const EdgeInsets.all(8.0),
       child: Image.asset(url),
     )).toList(),
     autoPlayInterval: 3000,
     isLoop: true,
   );
  }
}

