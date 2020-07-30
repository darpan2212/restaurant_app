import 'package:restaurant_verve/repos/model/store_detail.dart';

abstract class StoreDetailsState {
  final StoreDetail storeDetail;

  StoreDetailsState({this.storeDetail});
}

class StoreDetailsInitial extends StoreDetailsState {}

class StoreDetailsFailure extends StoreDetailsState {}

class StoreDetailsSuccess extends StoreDetailsState {
  final StoreDetail storeDetail;
  StoreDetailsSuccess({this.storeDetail}) : super(storeDetail: storeDetail);
}
