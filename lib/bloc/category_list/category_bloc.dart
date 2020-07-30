import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/base/call_api.dart';
import 'package:restaurant_verve/bloc/category_list/category_event.dart';
import 'package:restaurant_verve/bloc/category_list/category_state.dart';
import 'package:restaurant_verve/repos/model/category_list.dart';

export 'category_event.dart';
export 'category_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CallApi _callApi;

  CategoriesBloc() : super(CategoriesInitial()) {
    _callApi = CallApi();
  }

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    final currentState = state;

    if (event is CategoriesFetch) {
      try {
        if (currentState is CategoriesInitial) {
          Categories categories = await _callApi.getCategories();
          yield CategoriesSuccess(categories: categories);
          return;
        }
      } catch (e) {
        yield CategoriesFailure();
        return;
      }
    }
    yield null;
    return;
  }
}
