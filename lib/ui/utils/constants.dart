abstract class Constants{
  static const String baseUrl = "ecommerce.routemisr.com";
  static const String internetErrorMessage = "No internet connection please make sure you are connected";
  static const String generalErrorMessage = "Something went wrong please try again later";

}
abstract class EndPoints{
  static const String login = "api/v1/auth/signin";
  static const String register = "api/v1/auth/signup";
  static const String getCategories = "api/v1/categories";
  static const String getAllProducts = "api/v1/products";

}