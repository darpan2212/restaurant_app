class ManageCart {
  int userId;
  int storeId;
  int itemId;
  int itemVariantsId;
  int quantity;
  int cartType;
  int removeCart;
  int addNew;
  List<Choices> choices;
  List<Addons> addons;
  List<ComboItems> comboItems;

  ManageCart(
      {this.userId,
      this.storeId,
      this.itemId,
      this.itemVariantsId,
      this.quantity,
      this.cartType,
      this.removeCart,
      this.addNew,
      this.choices,
      this.addons,
      this.comboItems});

  ManageCart.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    storeId = json['store_id'];
    itemId = json['item_id'];
    itemVariantsId = json['item_variants_id'];
    quantity = json['quantity'];
    cartType = json['cart_type'];
    removeCart = json['remove_cart'];
    addNew = json['add_new'];
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
    if (json['combo_items'] != null) {
      comboItems = new List<ComboItems>();
      json['combo_items'].forEach((v) {
        comboItems.add(new ComboItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['item_id'] = this.itemId;
    data['item_variants_id'] = this.itemVariantsId;
    data['quantity'] = this.quantity;
    data['cart_type'] = this.cartType;
    data['remove_cart'] = this.removeCart;
    data['add_new'] = this.addNew;
    if (this.choices != null) {
      data['choices'] = this.choices.map((v) => v.toJson()).toList();
    }
    if (this.addons != null) {
      data['addons'] = this.addons.map((v) => v.toJson()).toList();
    }
    if (this.comboItems != null) {
      data['combo_items'] = this.comboItems.map((v) => v.toJson()).toList();
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

class ComboItems {
  int comboItemId;
  int comboItemDetailId;
  int quantity;
  List<Choices> choices;
  List<Addons> addons;

  ComboItems(
      {this.comboItemId,
      this.comboItemDetailId,
      this.quantity,
      this.choices,
      this.addons});

  ComboItems.fromJson(Map<String, dynamic> json) {
    comboItemId = json['combo_item_id'];
    comboItemDetailId = json['combo_item_detail_id'];
    quantity = json['quantity'];
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
    data['combo_item_id'] = this.comboItemId;
    data['combo_item_detail_id'] = this.comboItemDetailId;
    data['quantity'] = this.quantity;
    if (this.choices != null) {
      data['choices'] = this.choices.map((v) => v.toJson()).toList();
    }
    if (this.addons != null) {
      data['addons'] = this.addons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChoicesCombo {
  int variantChoiceId;
  int variantChoicePriceId;

  ChoicesCombo({this.variantChoiceId, this.variantChoicePriceId});

  ChoicesCombo.fromJson(Map<String, dynamic> json) {
    variantChoiceId = json['variant_choice_id'];
    variantChoicePriceId = json['variant_choice_price_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_choice_id'] = this.variantChoiceId;
    data['variant_choice_price_id'] = this.variantChoicePriceId;
    return data;
  }
}

class AddonsCombo {
  int variantAddonId;
  int variantAddonPriceId;

  AddonsCombo({this.variantAddonId, this.variantAddonPriceId});

  AddonsCombo.fromJson(Map<String, dynamic> json) {
    variantAddonId = json['variant_addon_id'];
    variantAddonPriceId = json['variant_addon_price_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_addon_id'] = this.variantAddonId;
    data['variant_addon_price_id'] = this.variantAddonPriceId;
    return data;
  }
}
