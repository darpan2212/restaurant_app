import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:restaurant_verve/base/base_screen.dart';
import 'package:restaurant_verve/bloc/bloc.dart';
import 'package:restaurant_verve/config/theme.dart';
import 'package:restaurant_verve/repos/model/category_list.dart';
import 'package:restaurant_verve/repos/model/store_detail.dart';
import 'package:restaurant_verve/screen/home/category_tab_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier _currentPageNotifier = ValueNotifier<int>(0);
  PageController _pageController;
  Timer _timer;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailBloc, StoreDetailsState>(
      builder: (_, state) {
        if (state is StoreDetailsSuccess) {
          StoreDetail store = state.storeDetail;
          return homeScreenSuccess(store);
        } else if (state is StoreDetailsFailure) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text('There is some technical issue, please try again '
                  'after some time.'),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget homeScreenSuccess(StoreDetail store) {
    return BaseScreen(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          store.data.store.storeName,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 120,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildImagesPageView(store),
              buildCurrentStoreStatus(store),
              Expanded(
                child: buildCategoryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImagesPageView(StoreDetail store) {
    _timer = Timer.periodic(
      Duration(
        seconds: 4,
      ),
      (timer) {
        if (store.data.storeImages.length > 1) {
          if ((_pageController.page.toInt() + 1) <
              store.data.storeImages.length) {
            _pageController.nextPage(
              duration: Duration(
                milliseconds: 100,
              ),
              curve: Curves.linear,
            );
          } else {
            _pageController.animateToPage(
              0,
              duration: Duration(
                milliseconds: 100,
              ),
              curve: Curves.linear,
            );
          }
        } else {
          timer.cancel();
        }
      },
    );
    return Container(
      color: Colors.blue,
      height: 150,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              _currentPageNotifier.value = value;
            },
            itemBuilder: (context, position) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(store.data.storeImages[position]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: store.data.storeImages.length,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CirclePageIndicator(
                itemCount: store.data.storeImages.length,
                currentPageNotifier: _currentPageNotifier,
                selectedDotColor: Colors.black,
                dotColor: Colors.white,
                onPageSelected: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCurrentStoreStatus(StoreDetail store) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(12),
      color: AppColors.blue,
      child: Container(
        child: Row(
          children: <Widget>[
            buildCategoryIcon(store),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: buildStatusColumn(store),
            ),
          ],
        ),
      ),
    );
  }

  Stack buildCategoryIcon(StoreDetail store) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            image: DecorationImage(
              image: NetworkImage(store.data.store.categoryCustomerIcon),
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, top: 20),
          height: 18,
          width: 18,
          child: Icon(
            Icons.call,
            size: 10,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: AppColors.green,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }

  Widget buildStatusColumn(StoreDetail store) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 25,
              width: 60,
              child: Center(
                child: Text(
                  'Open',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Closing in 1 hour',
              style: TextStyle(
                color: AppColors.red,
                fontSize: 12,
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      size: 25,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.directions_bike,
                    color: AppColors.black,
                    size: 20,
                  ),
                  Text(
                    ' \u20B9 ${store.data.orderSettings.deliveryCharges}',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: AppColors.black,
                    size: 20,
                  ),
                  Text(
                    ' ${store.data.orderSettings.fromMin}-${store.data.orderSettings.toMin} Mins',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'Min Order: \u20B9${store.data.orderSettings.minOrderAmount}',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (_, state) {
        if (state is CategoriesSuccess) {
          Categories categories = state.categories;
          return buildCategoryTab(categories);
        }
        return Text('No Category');
      },
    );
  }

  Widget buildCategoryTab(Categories categories) {
    return Container(
      child: CategoryTabControllerScreen(categories: categories),
    );
  }
}
