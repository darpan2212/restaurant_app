class StoreDetailReq {
  String storeId;
  String categoryId;
  String userId;
  String page;
  String searchQuery;

  StoreDetailReq({
    this.storeId = '',
    this.categoryId = '',
    this.userId = '',
    this.page = '',
    this.searchQuery = '',
  });

  StoreDetailReq.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    page = json['page'];
    searchQuery = json['search_query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['page'] = this.page;
    data['search_query'] = this.searchQuery;
    return data;
  }
}
