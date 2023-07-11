import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/repos/home_repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/models/BaseError.dart';
import '../../../../../data/models/add_to_cart_response.dart';
import '../../../../../data/models/categories_response.dart';
import '../../../../../data/models/products_response.dart';
import '../../../../../domain/repos/home_repo/home_repo.dart';

class HomeViewModel extends Cubit<HomeStates> {
  List<CategoryDM>? categories;
  List<ProductDM>? products;
  HomeRepo repo = HomeRepoImpl();
  HomeViewModel():super(HomeInitialState());

  void getCategories() async{
    emit(HomeLoadingState());
    Either<BaseError, List<CategoryDM>> either = await repo.getCategories();
    either.fold((error) {
      emit(HomeErrorState(error.message));
    },(list){
      categories = list;
      if(products != null){
        emit(HomeSuccessState());
      }
    });
  }

  void getProducts() async{
    emit(HomeLoadingState());
    Either<BaseError, List<ProductDM>> either = await repo.getAllProducts();
    either.fold((error) {
      emit(HomeErrorState(error.message));
    },(list){
      products = list;
      if(categories != null){
        emit(HomeSuccessState());
      }
    });
  }

  void addProductToCart(String productId) async{
    emit(HomeDialogLoadingState());
    Either<BaseError, AddToCartResponse> either = await repo.addToCart(productId);
    either.fold((error) {
      if(error is ExpiredTokenError){
        emit(NavigateToLoginScreenState());
      }else {
        emit(HomeErrorState(error.message));
      }
    }, (response){
      emit(AddProductSuccessState());
    });
  }
}

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeDialogLoadingState extends HomeStates{}
class HomeErrorState extends HomeStates{
  String message;
  HomeErrorState(this.message);
}
class HomeSuccessState extends HomeStates{}
class AddProductSuccessState extends HomeStates{}
class NavigateToLoginScreenState extends HomeStates{}

