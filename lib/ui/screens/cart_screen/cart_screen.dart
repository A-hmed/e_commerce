import 'package:e_commerce/data/models/get_user_cart_response.dart';
import 'package:e_commerce/ui/screens/cart_screen/cart_view_model.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  static  String routeName = "cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartViewModel viewModel = CartViewModel();
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/app_bar_logo.png",
          color: AppColors.primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:BlocConsumer(
        bloc:viewModel..getProductsList(),
        listener: (context, state){
          if(state is CartErrorState){
            showErrorDialog(context, state.message);
          }
        },
        builder: (context, state){
          if(state is CartSuccessState){
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: state.data.products!.length,
                        itemBuilder: (context, index) =>
                            buildCartItem(
                              state.data.products![index]
                            )
                    )),
                Text("Total price: EGP:${state.data.totalCartPrice}")
              ],
            );
          }
          else if(state is CartLoadingState) {
            return Center(child: CircularProgressIndicator());
          }else {
            return SizedBox();
          }
        },
      ),
    );
  }
  Widget buildCartItem(CartProduct cartProduct){
    return Container(
        height: height*.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[400]!, width: 3)
      ),
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(cartProduct.product!.imageCover!, height: height*.15, width: width*.25,)),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("${cartProduct.product!.title}", style: TextStyle(color: AppColors.primaryColor, fontSize: 16),),
                  Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("EGP(${cartProduct.price})", style: TextStyle(color: AppColors.primaryColor, fontSize: 16)),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: (){
                                      viewModel.decreaseProuectCount(cartProduct.id!, cartProduct.count! - 1);
                                    },
                                    child: ImageIcon(AssetImage("assets/images/ic_decrease.png"), color: Colors.white, size: 35,)),
                                Text("${cartProduct.count}", style: TextStyle(color: Colors.white, fontSize: 18),),
                                ImageIcon(AssetImage("assets/images/ic_increase.png"),color: Colors.white, size: 35,),
                              ],
                            ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
