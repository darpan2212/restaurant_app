import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/base/call_api.dart';
import 'package:restaurant_verve/bloc/manage_cart/manage_cart_event.dart';
import 'package:restaurant_verve/bloc/manage_cart/manage_cart_state.dart';
import 'package:restaurant_verve/repos/model/network/manage_cart.dart';
import 'package:restaurant_verve/utils/logger.dart';

export 'manage_cart_event.dart';
export 'manage_cart_state.dart';

class ManageCartBloc extends Bloc<ManageCartEvent, ManageCartState> {
  CallApi _callApi;

  ManageCartBloc() : super(ManageCartInitial()) {
    _callApi = CallApi();
  }

  @override
  Stream<ManageCartState> mapEventToState(ManageCartEvent event) async* {
    final currentState = state;

    if (event is ManageCartFetched) {
      try {
        if (currentState is ManageCartInitial) {
          yield ManageCartSuccess(manageCart: ManageCart());
          return;
        }
      } catch (e) {
        Logger.printObj(e);
        yield ManageCartFailure();
        return;
      }
    }
    yield null;
    return;
  }
}
