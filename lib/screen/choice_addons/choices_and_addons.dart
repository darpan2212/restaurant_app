import 'package:flutter/material.dart';
import 'package:restaurant_verve/base/base_screen.dart';
import 'package:restaurant_verve/config/theme.dart';
import 'package:restaurant_verve/repos/model/product_by_category.dart';

class ChoicesAndAddonsScreen extends StatefulWidget {
  final Items items;

  ChoicesAndAddonsScreen(this.items);

  @override
  _ChoicesAndAddonsScreenState createState() => _ChoicesAndAddonsScreenState();
}

class _ChoicesAndAddonsScreenState extends State<ChoicesAndAddonsScreen> {
  Items items;

  @override
  void initState() {
    items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: buildAppBar(context),
      isBottomNavigation: false,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: items.itemVariants.length,
              itemBuilder: (_, itemVarPos) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.itemVariants[itemVarPos].addons.length,
                  itemBuilder: (_, addonPos) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${items.itemVariants[itemVarPos].addons[addonPos].variantAddonName}',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items.itemVariants[itemVarPos]
                                .addons[addonPos].addonPrices.length,
                            itemBuilder: (_, addOnPricePos) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: items
                                                .itemVariants[itemVarPos]
                                                .addons[addonPos]
                                                .addonPrices[addOnPricePos]
                                                .isAdded ==
                                            1,
                                        onChanged: (isCheck) {
                                          setState(() {
                                            isCheck
                                                ? items
                                                    .itemVariants[itemVarPos]
                                                    .addons[addonPos]
                                                    .addonPrices[addOnPricePos]
                                                    .isAdded = 1
                                                : items
                                                    .itemVariants[itemVarPos]
                                                    .addons[addonPos]
                                                    .addonPrices[addOnPricePos]
                                                    .isAdded = 0;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget
                                              .items
                                              .itemVariants[itemVarPos]
                                              .addons[addonPos]
                                              .addonPrices[addOnPricePos]
                                              .variantSubAddonName,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget
                                              .items
                                              .itemVariants[itemVarPos]
                                              .addons[addonPos]
                                              .addonPrices[addOnPricePos]
                                              .price,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.darkGray,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppColors.black,
                                  ),
                                ],
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  color: AppColors.lightblue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(
        items.itemName,
      ),
      elevation: 0.0,
    );
  }
}
