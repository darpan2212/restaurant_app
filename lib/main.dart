import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/bloc/bloc.dart';
import 'package:restaurant_verve/bloc/category_list/category_bloc.dart';
import 'package:restaurant_verve/config/theme.dart';
import 'package:restaurant_verve/screen/home/home_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreDetailBloc storeBloc = StoreDetailBloc()..add(StoreDetailsFetched());
    CategoriesBloc categoriesBloc = CategoriesBloc()..add(CategoriesFetch());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: RestaurantTheme.of(context),
      home: SafeArea(
        child: MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<StoreDetailBloc>(create: (_) {
              return storeBloc;
            }),
            BlocProvider<CategoriesBloc>(create: (_) {
              return categoriesBloc;
            }),
          ],
          child: HomeScreen(),
        ),
      ),
    );
  }
}
