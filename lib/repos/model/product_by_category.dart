class ProductByCategory {
  int status;
  String message;
  List<Data> data;

  ProductByCategory({this.status, this.message, this.data});

  ProductByCategory.fromJson(Map<String, dynamic> json) {
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
  List<Items> items;

  Data(
      {this.categoryId,
      this.categoryName,
      this.categoryDescription,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String subCategoryName;
  String subCategoryDescription;
  int subCategoryId;
  int itemId;
  String itemName;
  String brandName;
  String itemDescription;
  String itemImage;
  String itemImageThumb;
  int outOfStock;
  int maskPrice;
  int itemType;
  int prescription;
  int maskImage;
  String isCombo;
  String comboDescription;
  String itemPrice;
  int notifyMe;
  List<ItemVariants> itemVariants;

  Items(
      {this.subCategoryName,
      this.subCategoryDescription,
      this.subCategoryId,
      this.itemId,
      this.itemName,
      this.brandName,
      this.itemDescription,
      this.itemImage,
      this.itemImageThumb,
      this.outOfStock,
      this.maskPrice,
      this.itemType,
      this.prescription,
      this.maskImage,
      this.isCombo,
      this.comboDescription,
      this.itemPrice,
      this.notifyMe,
      this.itemVariants});

  Items.fromJson(Map<String, dynamic> json) {
    subCategoryName = json['sub_category_name'];
    subCategoryDescription = json['sub_category_description'];
    subCategoryId = json['sub_category_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    brandName = json['brand_name'];
    itemDescription = json['item_description'];
    itemImage = json['item_image'];
    itemImageThumb = json['item_image_thumb'];
    outOfStock = json['out_of_stock'];
    maskPrice = json['mask_price'];
    itemType = json['item_type'];
    prescription = json['prescription'];
    maskImage = json['mask_image'];
    isCombo = json['is_combo'];
    comboDescription = json['combo_description'];
    itemPrice = json['item_price'];
    notifyMe = json['notify_me'];
    if (json['item_variants'] != null) {
      itemVariants = new List<ItemVariants>();
      json['item_variants'].forEach((v) {
        itemVariants.add(new ItemVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_name'] = this.subCategoryName;
    data['sub_category_description'] = this.subCategoryDescription;
    data['sub_category_id'] = this.subCategoryId;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['brand_name'] = this.brandName;
    data['item_description'] = this.itemDescription;
    data['item_image'] = this.itemImage;
    data['item_image_thumb'] = this.itemImageThumb;
    data['out_of_stock'] = this.outOfStock;
    data['mask_price'] = this.maskPrice;
    data['item_type'] = this.itemType;
    data['prescription'] = this.prescription;
    data['mask_image'] = this.maskImage;
    data['is_combo'] = this.isCombo;
    data['combo_description'] = this.comboDescription;
    data['item_price'] = this.itemPrice;
    data['notify_me'] = this.notifyMe;
    if (this.itemVariants != null) {
      data['item_variants'] = this.itemVariants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemVariants {
  int itemVariantsId;
  String itemPrice;
  String discountedPrice;
  int packagingId;
  String packagingName;
  int unitId;
  String unitQuantity;
  String unitName;
  String sku;
  int outOfStock;
  int maskPrice;
  int minQty;
  int maxQty;
  String packaging;
  int isChoiceAddon;
  String quantity;
  int isAdded;
  List<Choices> choices;
  List<Addons> addons;

  ItemVariants(
      {this.itemVariantsId,
      this.itemPrice,
      this.discountedPrice,
      this.packagingId,
      this.packagingName,
      this.unitId,
      this.unitQuantity,
      this.unitName,
      this.sku,
      this.outOfStock,
      this.maskPrice,
      this.minQty,
      this.maxQty,
      this.packaging,
      this.isChoiceAddon,
      this.quantity,
      this.isAdded,
      this.choices,
      this.addons});

  ItemVariants.fromJson(Map<String, dynamic> json) {
    itemVariantsId = json['item_variants_id'];
    itemPrice = json['item_price'];
    discountedPrice = json['discounted_price'];
    packagingId = json['packaging_id'];
    packagingName = json['packaging_name'];
    unitId = json['unit_id'];
    unitQuantity = json['unit_quantity'];
    unitName = json['unit_name'];
    sku = json['sku'];
    outOfStock = json['out_of_stock'];
    maskPrice = json['mask_price'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    packaging = json['packaging'];
    isChoiceAddon = json['is_choice_addon'];
    quantity = json['quantity'];
    isAdded = json['is_added'];
    if (json['choices'] != null) {
      choices = new List<Choices>();
      json['choices'].forEach((v) {
        choices.add(new Choices.fromJson(v));
      });
    }
    if (json['addons'] != null) {
      addons = new List<Addons>();
      json['addons'].forEach((v) {
        addons.add(new Addons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_variants_id'] = this.itemVariantsId;
    data['item_price'] = this.itemPrice;
    data['discounted_price'] = this.discountedPrice;
    data['packaging_id'] = this.packagingId;
    data['packaging_name'] = this.packagingName;
    data['unit_id'] = this.unitId;
    data['unit_quantity'] = this.unitQuantity;
    data['unit_name'] = this.unitName;
    data['sku'] = this.sku;
    data['out_of_stock'] = this.outOfStock;
    data['mask_price'] = this.maskPrice;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['packaging'] = this.packaging;
    data['is_choice_addon'] = this.isChoiceAddon;
    data['quantity'] = this.quantity;
    data['is_added'] = this.isAdded;
    if (this.choices != null) {
      data['choices'] = this.choices.map((v) => v.toJson()).toList();
    }
    if (this.addons != null) {
      data['addons'] = this.addons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  int variantChoiceId;
  int defaultChoiceId;
  String variantChoiceName;
  List<ChoicePrices> choicePrices;

  Choices(
      {this.variantChoiceId,
      this.defaultChoiceId,
      this.variantChoiceName,
      this.choicePrices});

  Choices.fromJson(Map<String, dynamic> json) {
    variantChoiceId = json['variant_choice_id'];
    defaultChoiceId = json['default_choice_id'];
    variantChoiceName = json['variant_choice_name'];
    if (json['choice_prices'] != null) {
      choicePrices = new List<ChoicePrices>();
      json['choice_prices'].forEach((v) {
        choicePrices.add(new ChoicePrices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_choice_id'] = this.variantChoiceId;
    data['default_choice_id'] = this.defaultChoiceId;
    data['variant_choice_name'] = this.variantChoiceName;
    if (this.choicePrices != null) {
      data['choice_prices'] = this.choicePrices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChoicePrices {
  int variantChoicePriceId;
  int defaultChoicePriceId;
  String variantSubChoiceName;
  String price;
  int variantChoiceId;
  int isAdded;

  ChoicePrices(
      {this.variantChoicePriceId,
      this.defaultChoicePriceId,
      this.variantSubChoiceName,
      this.price,
      this.variantChoiceId,
      this.isAdded});

  ChoicePrices.fromJson(Map<String, dynamic> json) {
    variantChoicePriceId = json['variant_choice_price_id'];
    defaultChoicePriceId = json['default_choice_price_id'];
    variantSubChoiceName = json['variant_sub_choice_name'];
    price = json['price'];
    variantChoiceId = json['variant_choice_id'];
    isAdded = json['is_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_choice_price_id'] = this.variantChoicePriceId;
    data['default_choice_price_id'] = this.defaultChoicePriceId;
    data['variant_sub_choice_name'] = this.variantSubChoiceName;
    data['price'] = this.price;
    data['variant_choice_id'] = this.variantChoiceId;
    data['is_added'] = this.isAdded;
    return data;
  }
}

class Addons {
  int variantAddonId;
  int defaultAddonId;
  String variantAddonName;
  List<AddonPrices> addonPrices;

  Addons(
      {this.variantAddonId,
      this.defaultAddonId,
      this.variantAddonName,
      this.addonPrices});

  Addons.fromJson(Map<String, dynamic> json) {
    variantAddonId = json['variant_addon_id'];
    defaultAddonId = json['default_addon_id'];
    variantAddonName = json['variant_addon_name'];
    if (json['addon_prices'] != null) {
      addonPrices = new List<AddonPrices>();
      json['addon_prices'].forEach((v) {
        addonPrices.add(new AddonPrices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_addon_id'] = this.variantAddonId;
    data['default_addon_id'] = this.defaultAddonId;
    data['variant_addon_name'] = this.variantAddonName;
    if (this.addonPrices != null) {
      data['addon_prices'] = this.addonPrices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddonPrices {
  int variantAddonPriceId;
  int defaultAddonPriceId;
  String variantSubAddonName;
  String price;
  int variantAddonId;
  int isAdded;

  AddonPrices(
      {this.variantAddonPriceId,
      this.defaultAddonPriceId,
      this.variantSubAddonName,
      this.price,
      this.variantAddonId,
      this.isAdded});

  AddonPrices.fromJson(Map<String, dynamic> json) {
    variantAddonPriceId = json['variant_addon_price_id'];
    defaultAddonPriceId = json['default_addon_price_id'];
    variantSubAddonName = json['variant_sub_addon_name'];
    price = json['price'];
    variantAddonId = json['variant_addon_id'];
    isAdded = json['is_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_addon_price_id'] = this.variantAddonPriceId;
    data['default_addon_price_id'] = this.defaultAddonPriceId;
    data['variant_sub_addon_name'] = this.variantSubAddonName;
    data['price'] = this.price;
    data['variant_addon_id'] = this.variantAddonId;
    data['is_added'] = this.isAdded;
    return data;
  }
}
