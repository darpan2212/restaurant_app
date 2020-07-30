import 'package:restaurant_verve/repos/model/category_list.dart';

abstract class CategoriesState {
  final Categories categories;

  CategoriesState({this.categories});
}

class CategoriesInitial extends CategoriesState {}

class CategoriesFailure extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final Categories categories;
  CategoriesSuccess({this.categories}) : super(categories: categories);
}
