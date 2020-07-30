import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/base/call_api.dart';
import 'package:restaurant_verve/bloc/bloc.dart';
import 'package:restaurant_verve/repos/model/product_by_category.dart';
import 'package:restaurant_verve/utils/logger.dart';

export 'product_by_category_event.dart';
export 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  final int categoryId;
  CallApi _callApi;

  ProductByCategoryBloc(this.categoryId) : super(ProductByCategoryInitial()) {
    _callApi = CallApi();
  }

  @override
  Stream<ProductByCategoryState> mapEventToState(
      ProductByCategoryEvent event) async* {
    final currentState = state;

    if (event is ProductByCategoryFetch) {
      try {
        if (currentState is ProductByCategoryInitial) {
          ProductByCategory products =
              await _callApi.getProductByCategory(categoryId);
          yield ProductByCategorySuccess(products: products);
          return;
        }
      } catch (e) {
        Logger.printObj(e);
        yield ProductByCategoryFailure();
        return;
      }
    }
    yield null;
    return;
  }
}
