import 'package:restaurant_verve/repos/model/product_by_category.dart';

abstract class ProductByCategoryState {
  final ProductByCategory products;

  ProductByCategoryState({this.products});
}

class ProductByCategoryInitial extends ProductByCategoryState {}

class ProductByCategoryFailure extends ProductByCategoryState {}

class ProductByCategorySuccess extends ProductByCategoryState {
  final ProductByCategory products;

  ProductByCategorySuccess({this.products}) : super(products: products);
}
