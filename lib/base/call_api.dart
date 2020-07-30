import 'dart:convert';

import 'package:device_id/device_id.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_verve/config/theme.dart';
import 'package:restaurant_verve/repos/model/category_list.dart';
import 'package:restaurant_verve/repos/model/network/store_detail_req.dart';
import 'package:restaurant_verve/repos/model/product_by_category.dart';
import 'package:restaurant_verve/repos/model/store_detail.dart';
import 'package:restaurant_verve/utils/logger.dart';

class CallApi {
  Future<StoreDetail> getStoreDetails() async {
    String url = '${AppConstant.baseUrl}customer/get_store_page_details';
    String deviceId = await DeviceId.getID;
    Logger.printObj('$url\nDeviceId :- $deviceId');
    http.Response response = await http.post(
      url,
      headers: {
        'Language-Code': 'en',
        'App-Version': '${AppConstant.version}',
        'token': 'c2d923f48ae310ce9a8b57b705fe7879',
        'device-id': '$deviceId',
      },
      body: StoreDetailReq(storeId: '205').toJson(),
    );
    if (response.statusCode == 200) {
      Logger.printObj(response.body);
      final storeData = StoreDetail.fromJson(json.decode(response.body));
      return storeData;
    } else {
      throw Exception('error fetching store details');
    }
  }

  Future<Categories> getCategories() async {
    String url = '${AppConstant.baseUrl}customer/categories_list';
    String deviceId = await DeviceId.getID;
    Logger.printObj('$url\nDeviceId :- $deviceId');
    http.Response response = await http.post(
      url,
      headers: {
        'Language-Code': 'en',
        'App-Version': '${AppConstant.version}',
        'token': 'c2d923f48ae310ce9a8b57b705fe7879',
        'device-id': '$deviceId',
      },
      body: StoreDetailReq(storeId: '205').toJson(),
    );
    if (response.statusCode == 200) {
      Logger.printObj(response.body);
      final categories = Categories.fromJson(json.decode(response.body));
      return categories;
    } else {
      throw Exception('error fetching categories');
    }
  }

  Future<ProductByCategory> getProductByCategory(int categoryId) async {
    String url = '${AppConstant.baseUrl}customer/category_wise_items_for_khata';
    String deviceId = await DeviceId.getID;
    Logger.printObj('$url\nDeviceId :- $deviceId');
    var jsonBodyReq = StoreDetailReq(
      storeId: '205',
      categoryId: '$categoryId',
      userId: '336',
      page: '1',
      searchQuery: '',
    ).toJson();
    Logger.printObj('json Req :-> $jsonBodyReq');
    http.Response response = await http.post(
      url,
      headers: {
        'Language-Code': 'en',
        'App-Version': '${AppConstant.version}',
        'token': 'c2d923f48ae310ce9a8b57b705fe7879',
        'device-id': '$deviceId',
      },
      body: jsonBodyReq,
    );
    if (response.statusCode == 200) {
      Logger.printObj(response.body);
      final products = ProductByCategory.fromJson(json.decode(response.body));
      return products;
    } else {
      throw Exception('error fetching products');
    }
  }
}
