class Categories {
  int status;
  String message;
  List<Data> data;

  Categories({this.status, this.message, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int categoryId;
  String categoryName;
  String categoryDescription;
  int count;
  int variantsCount;
  List<SubCategories> subCategories;

  Data(
      {this.categoryId,
      this.categoryName,
      this.categoryDescription,
      this.count,
      this.variantsCount,
      this.subCategories});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    count = json['count'];
    variantsCount = json['variants_count'];
    if (json['sub_categories'] != null) {
      subCategories = new List<SubCategories>();
      json['sub_categories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    data['count'] = this.count;
    data['variants_count'] = this.variantsCount;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int subCategoryId;
  String subCategoryName;
  String subCategoryDescription;
  int count;
  int variantsCount;

  SubCategories(
      {this.subCategoryId,
      this.subCategoryName,
      this.subCategoryDescription,
      this.count,
      this.variantsCount});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryDescription = json['sub_category_description'];
    count = json['count'];
    variantsCount = json['variants_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_name'] = this.subCategoryName;
    data['sub_category_description'] = this.subCategoryDescription;
    data['count'] = this.count;
    data['variants_count'] = this.variantsCount;
    return data;
  }
}
