import 'package:e_commerce/data/models/products_response.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductDM productDM;
  ProductItem(this.productDM);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width * .4,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBlue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(productDM.imageCover??"",
                width: double.infinity,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height *.15,),
              Image.asset("assets/images/ic_add_to_wishlist.png", scale: .8,)
            ],
          ),
          Text(productDM.title??"" , textAlign: TextAlign.start,),
          Row(
            children: [
              Text("Review(${productDM.ratingsAverage})"),
              Icon(Icons.star, color: Colors.amberAccent,),
            ],
          ),
          Row(
            children: [
              Text("EGP ${productDM.price}"),
              Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: (){

                }, child:const Icon(Icons.add, color: Colors.white,),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
