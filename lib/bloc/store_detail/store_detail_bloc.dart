import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/base/call_api.dart';
import 'package:restaurant_verve/bloc/bloc.dart';
import 'package:restaurant_verve/repos/model/store_detail.dart';
import 'package:restaurant_verve/utils/logger.dart';

export 'store_detail_event.dart';
export 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailsEvent, StoreDetailsState> {
  CallApi _callApi;

  StoreDetailBloc() : super(StoreDetailsInitial()) {
    _callApi = CallApi();
  }

  @override
  Stream<StoreDetailsState> mapEventToState(StoreDetailsEvent event) async* {
    final currentState = state;

    if (event is StoreDetailsFetched) {
      try {
        if (currentState is StoreDetailsInitial) {
          StoreDetail storeDetails = await _callApi.getStoreDetails();
          yield StoreDetailsSuccess(storeDetail: storeDetails);
          return;
        }
      } catch (e) {
        Logger.printObj(e);
        yield StoreDetailsFailure();
        return;
      }
    }
    yield null;
    return;
  }
}
