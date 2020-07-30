import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_verve/bloc/bloc.dart';
import 'package:restaurant_verve/config/theme.dart';
import 'package:restaurant_verve/repos/model/category_list.dart';
import 'package:restaurant_verve/repos/model/product_by_category.dart';

import 'file:///D:/Projects/Flutter/restaurant_verve/lib/screen/choice_addons/choices_and_addons.dart';

class CategoryTabControllerScreen extends StatefulWidget {
  final Categories categories;

  CategoryTabControllerScreen({this.categories});

  @override
  _CategoryTabControllerScreenState createState() =>
      _CategoryTabControllerScreenState();
}

class _CategoryTabControllerScreenState
    extends State<CategoryTabControllerScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  Categories categories;

  @override
  void initState() {
    super.initState();
    categories = widget.categories;
    tabController = TabController(
      length: categories.data.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar _getTabBar() {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabs: categories.data.map((rawCategory) {
        return Tab(
          child: Text(
            '${rawCategory.categoryName}',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _getTabBar(),
            Divider(
              color: AppColors.black,
            ),
            Expanded(
              child: Container(
                child: _getTabBarView(
                  categories.data.map((rawCategory) {
                    return buildProductList(rawCategory.categoryId);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductList(int categoryId) {
    return BlocProvider<ProductByCategoryBloc>(
      create: (BuildContext context) {
        return ProductByCategoryBloc(categoryId)..add(ProductByCategoryFetch());
      },
      child: BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (_, state) {
          if (state is ProductByCategorySuccess) {
            ProductByCategory product = state.products;
            if (product.status == 1) {
              return Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemBuilder: (_, dataPos) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, itemPos) {
                        return Column(
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      height: 120,
                                      width: 120,
                                      image: NetworkImage(product.data[dataPos]
                                          .items[itemPos].itemImage),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            product.data[dataPos].items[itemPos]
                                                .itemName,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          product.data[dataPos].items[itemPos]
                                                      .itemVariants.length >
                                                  1
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (_) {
                                                          return ChoicesAndAddonsScreen(
                                                              product
                                                                  .data[dataPos]
                                                                  .items[itemPos]);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Choices/Addons available',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.lightblue,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                )
                                              : Text(''),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        '\u20B9 ${product.data[dataPos].items[itemPos].itemPrice}',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'ADD',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: AppColors.black,
                            ),
                          ],
                        );
                      },
                      itemCount: product.data[0].items.length,
                    );
                  },
                  itemCount: product.data.length,
                ),
              );
            } else {
              return Center(
                child: Text('${product.message}'),
              );
            }
          } else if (state is ProductByCategoryFailure) {
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
      ),
    );
  }
}
