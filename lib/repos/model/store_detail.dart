class StoreDetail {
  int status;
  String message;
  Data data;

  StoreDetail({this.status, this.message, this.data});

  StoreDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<String> storeImages;
  int storeStatus;
  Store store;
  List<BusinessHours> businessHours;
  OrderSettings orderSettings;
  List<PaymentMethods> paymentMethods;

  Data(
      {this.storeImages,
      this.storeStatus,
      this.store,
      this.businessHours,
      this.orderSettings,
      this.paymentMethods});

  Data.fromJson(Map<String, dynamic> json) {
    storeImages = json['store_images'].cast<String>();
    storeStatus = json['store_status'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    if (json['business_hours'] != null) {
      businessHours = new List<BusinessHours>();
      json['business_hours'].forEach((v) {
        businessHours.add(new BusinessHours.fromJson(v));
      });
    }
    orderSettings = json['order_settings'] != null
        ? new OrderSettings.fromJson(json['order_settings'])
        : null;
    if (json['payment_methods'] != null) {
      paymentMethods = new List<PaymentMethods>();
      json['payment_methods'].forEach((v) {
        paymentMethods.add(new PaymentMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_images'] = this.storeImages;
    data['store_status'] = this.storeStatus;
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    if (this.businessHours != null) {
      data['business_hours'] =
          this.businessHours.map((v) => v.toJson()).toList();
    }
    if (this.orderSettings != null) {
      data['order_settings'] = this.orderSettings.toJson();
    }
    if (this.paymentMethods != null) {
      data['payment_methods'] =
          this.paymentMethods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Store {
  int storeId;
  String manager;
  int userId;
  String phone;
  String storeName;
  String storeDescription;
  String storeAddress;
  String storeAddress2;
  String storeLogo;
  String storeLogoThumb;
  int categoryId;
  String categoryName;
  String categoryLabel;
  String categoryImages;
  int cityId;
  String cityName;
  int areaId;
  String areaName;
  String zipcode;
  int isFavourite;
  String itemType;
  int maskImage;
  String prescription;
  String categoryIcon;
  String categoryBigIcon;
  String categoryBlackIcon;
  String categoryCustomerIcon;
  int isConfirm;
  String isKhata;

  Store(
      {this.storeId,
      this.manager,
      this.userId,
      this.phone,
      this.storeName,
      this.storeDescription,
      this.storeAddress,
      this.storeAddress2,
      this.storeLogo,
      this.storeLogoThumb,
      this.categoryId,
      this.categoryName,
      this.categoryLabel,
      this.categoryImages,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaName,
      this.zipcode,
      this.isFavourite,
      this.itemType,
      this.maskImage,
      this.prescription,
      this.categoryIcon,
      this.categoryBigIcon,
      this.categoryBlackIcon,
      this.categoryCustomerIcon,
      this.isConfirm,
      this.isKhata});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    manager = json['manager'];
    userId = json['user_id'];
    phone = json['phone'];
    storeName = json['store_name'];
    storeDescription = json['store_description'];
    storeAddress = json['store_address'];
    storeAddress2 = json['store_address2'];
    storeLogo = json['store_logo'];
    storeLogoThumb = json['store_logo_thumb'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryLabel = json['category_label'];
    categoryImages = json['category_images'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    zipcode = json['zipcode'];
    isFavourite = json['is_favourite'];
    itemType = json['item_type'];
    maskImage = json['mask_image'];
    prescription = json['prescription'];
    categoryIcon = json['category_icon'];
    categoryBigIcon = json['category_big_icon'];
    categoryBlackIcon = json['category_black_icon'];
    categoryCustomerIcon = json['category_customer_icon'];
    isConfirm = json['is_confirm'];
    isKhata = json['is_khata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['manager'] = this.manager;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['store_name'] = this.storeName;
    data['store_description'] = this.storeDescription;
    data['store_address'] = this.storeAddress;
    data['store_address2'] = this.storeAddress2;
    data['store_logo'] = this.storeLogo;
    data['store_logo_thumb'] = this.storeLogoThumb;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_label'] = this.categoryLabel;
    data['category_images'] = this.categoryImages;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['zipcode'] = this.zipcode;
    data['is_favourite'] = this.isFavourite;
    data['item_type'] = this.itemType;
    data['mask_image'] = this.maskImage;
    data['prescription'] = this.prescription;
    data['category_icon'] = this.categoryIcon;
    data['category_big_icon'] = this.categoryBigIcon;
    data['category_black_icon'] = this.categoryBlackIcon;
    data['category_customer_icon'] = this.categoryCustomerIcon;
    data['is_confirm'] = this.isConfirm;
    data['is_khata'] = this.isKhata;
    return data;
  }
}

class BusinessHours {
  String fromTime;
  String toTime;
  String days;
  int isOpen;

  BusinessHours({this.fromTime, this.toTime, this.days, this.isOpen});

  BusinessHours.fromJson(Map<String, dynamic> json) {
    fromTime = json['from_time'];
    toTime = json['to_time'];
    days = json['days'];
    isOpen = json['is_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['days'] = this.days;
    data['is_open'] = this.isOpen;
    return data;
  }
}

class OrderSettings {
  int storeSettingId;
  int delivery;
  int pickup;
  String minOrderAmount;
  int deliveryRadius;
  String deliveryCharges;
  int acceptAfterClose;
  int deliveryTimeType;
  List<DeliveryTimes> deliveryTimes;
  int fromMin;
  int toMin;
  String deliveryDuration;
  int allowScheduling;
  int allowCancellation;
  String deliveryGap;
  List<DeliverySlots> deliverySlots;

  OrderSettings(
      {this.storeSettingId,
      this.delivery,
      this.pickup,
      this.minOrderAmount,
      this.deliveryRadius,
      this.deliveryCharges,
      this.acceptAfterClose,
      this.deliveryTimeType,
      this.deliveryTimes,
      this.fromMin,
      this.toMin,
      this.deliveryDuration,
      this.allowScheduling,
      this.allowCancellation,
      this.deliveryGap,
      this.deliverySlots});

  OrderSettings.fromJson(Map<String, dynamic> json) {
    storeSettingId = json['store_setting_id'];
    delivery = json['delivery'];
    pickup = json['pickup'];
    minOrderAmount = json['min_order_amount'];
    deliveryRadius = json['delivery_radius'];
    deliveryCharges = json['delivery_charges'];
    acceptAfterClose = json['accept_after_close'];
    deliveryTimeType = json['delivery_time_type'];
    if (json['delivery_times'] != null) {
      deliveryTimes = new List<DeliveryTimes>();
      json['delivery_times'].forEach((v) {
        deliveryTimes.add(new DeliveryTimes.fromJson(v));
      });
    }
    fromMin = json['from_min'];
    toMin = json['to_min'];
    deliveryDuration = json['delivery_duration'];
    allowScheduling = json['allow_scheduling'];
    allowCancellation = json['allow_cancellation'];
    deliveryGap = json['delivery_gap'];
    if (json['delivery_slots'] != null) {
      deliverySlots = new List<DeliverySlots>();
      json['delivery_slots'].forEach((v) {
        deliverySlots.add(new DeliverySlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_setting_id'] = this.storeSettingId;
    data['delivery'] = this.delivery;
    data['pickup'] = this.pickup;
    data['min_order_amount'] = this.minOrderAmount;
    data['delivery_radius'] = this.deliveryRadius;
    data['delivery_charges'] = this.deliveryCharges;
    data['accept_after_close'] = this.acceptAfterClose;
    data['delivery_time_type'] = this.deliveryTimeType;
    if (this.deliveryTimes != null) {
      data['delivery_times'] =
          this.deliveryTimes.map((v) => v.toJson()).toList();
    }
    data['from_min'] = this.fromMin;
    data['to_min'] = this.toMin;
    data['delivery_duration'] = this.deliveryDuration;
    data['allow_scheduling'] = this.allowScheduling;
    data['allow_cancellation'] = this.allowCancellation;
    data['delivery_gap'] = this.deliveryGap;
    if (this.deliverySlots != null) {
      data['delivery_slots'] =
          this.deliverySlots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryTimes {
  String fromTime;
  String toTime;

  DeliveryTimes({this.fromTime, this.toTime});

  DeliveryTimes.fromJson(Map<String, dynamic> json) {
    fromTime = json['from_time'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    return data;
  }
}

class DeliverySlots {
  String fromTime;
  String toTime;
  int days;
  int isOpen;

  DeliverySlots({this.fromTime, this.toTime, this.days, this.isOpen});

  DeliverySlots.fromJson(Map<String, dynamic> json) {
    fromTime = json['from_time'];
    toTime = json['to_time'];
    days = json['days'];
    isOpen = json['is_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['days'] = this.days;
    data['is_open'] = this.isOpen;
    return data;
  }
}

class PaymentMethods {
  int paymentMethodId;
  int allowOrderAboveKhataLimit;
  String maxOrderValue;
  int isAgree;
  String upiId;

  PaymentMethods(
      {this.paymentMethodId,
      this.allowOrderAboveKhataLimit,
      this.maxOrderValue,
      this.isAgree,
      this.upiId});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    paymentMethodId = json['payment_method_id'];
    allowOrderAboveKhataLimit = json['allow_order_above_khata_limit'];
    maxOrderValue = json['max_order_value'];
    isAgree = json['is_agree'];
    upiId = json['upi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method_id'] = this.paymentMethodId;
    data['allow_order_above_khata_limit'] = this.allowOrderAboveKhataLimit;
    data['max_order_value'] = this.maxOrderValue;
    data['is_agree'] = this.isAgree;
    data['upi_id'] = this.upiId;
    return data;
  }
}
