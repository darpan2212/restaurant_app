import 'package:restaurant_verve/repos/model/network/manage_cart.dart';

abstract class ManageCartState {
  final ManageCart manageCart;

  ManageCartState({this.manageCart});
}

class ManageCartInitial extends ManageCartState {}

class ManageCartFailure extends ManageCartState {}

class ManageCartSuccess extends ManageCartState {
  final ManageCart manageCart;
  ManageCartSuccess({this.manageCart}) : super(manageCart: manageCart);
}
