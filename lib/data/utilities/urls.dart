class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static const String homeSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String readProfile = '$_baseUrl/ReadProfile';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static const String writeReview = '$_baseUrl/CreateProductReview';
  static const String getProductWishList = '$_baseUrl/ProductWishList';
  static const String getCartList = '$_baseUrl/CartList';

  static String removeWishList(int id) => '$_baseUrl/RemoveWishList/$id';

  static String deleteCartList(int cartId) =>
      '$_baseUrl/DeleteCartList/$cartId';

  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productListByRemark(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  static String createWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';

  static String productDetailsById(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getReviewListByProduct(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
}
