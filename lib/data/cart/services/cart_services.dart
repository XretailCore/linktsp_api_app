import 'package:linktsp_api/core/models/cart_item_model.dart';
import 'package:linktsp_api/core/models/cart_sku_model.dart';
import 'package:linktsp_api/core/models/cart_summary_model.dart';
import 'package:linktsp_api/core/models/preorder_message_model.dart';
import 'package:linktsp_api/core/models/zone_details_model.dart';
import 'package:linktsp_api/data/cart/models/cart_model_v3.dart';
import 'package:linktsp_api/data/default_api.dart';
import 'package:linktsp_api/data/exception_api.dart';
import 'package:linktsp_api/data/result_model.dart';

class CartServiceImp implements CartService {
  CartServiceImp({required this.defaultApi});
  final DefaultApi defaultApi;

  @override
  Future<bool?> addToCart({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
  }) async {
    final response = await defaultApi.postData(
        data: cartSkuModel.map((e) => e.toJson()).toList(),
        path: 'profile/cart/AddItem',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? true;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<bool?> updateItemInCart({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
  }) async {
    final response = await defaultApi.postData(
        data: cartSkuModel.map((e) => e.toJson()).toList(),
        path: 'profile/cart/Add',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? true;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<List<CartItemModel>> getCartList({required int customerId}) async {
    final response = await defaultApi.getData(
        path: 'Profile/cart', queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return List<CartItemModel>.from(
          result.data.map((model) => CartItemModel.fromJson(model)));
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<List<CartItemModel>> guestCartUpdate(
      {required List<CartSkuModel> cartSkuModel, int version = 1}) async {
    final response = await defaultApi.postData(
        data: cartSkuModel,
        path: version == 1 ? 'guest/cart/update' : "Cart/guest/cart/update",
        version: version);
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return List<CartItemModel>.from(
          result.data.map((model) => CartItemModel.fromJson(model)));
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<PreOrderMessageModel> preOrderMessage(
      {required int customerId}) async {
    final response = await defaultApi.getData(
        path: 'profile/preOrederCart',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return PreOrderMessageModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<int> getCartCounter({required int customerId}) async {
    final response = await defaultApi.getData(
        path: 'profile/cart/Count',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<bool> removeFromCart(
      {required int skuId, required int customerId}) async {
    final response = await defaultApi.postData(
        path: 'Profile/cart/remove',
        queryParameters: {"CustomerID": customerId, "SKUID": skuId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? true;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<CartSummaryModel> getCartSummary(
      {required int customerId, int version = 1}) async {
    final response = await defaultApi.getData(
        path:
            version == 1 ? 'profile/cart/summary' : "Cart/profile/cart/summary",
        version: version,
        queryParameters: {
          "CustomerID": customerId,
        });
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return CartSummaryModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<String> cartDiscountNotification({required int customerId}) async {
    final response = await defaultApi.getData(
        path: 'TriggeredCart/cartDiscountNotification',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? '';
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<String> visitorDiscountNotification(
      {required List<CartSkuModel> cartSkuModel}) async {
    final response = await defaultApi.postData(
        data: cartSkuModel,
        path: 'TriggeredCart/visitorCartDiscountNotification');
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<List<ZoneDetailsModel>> getZoneDetails({int version = 3}) async {
    final response = await defaultApi.getData(
      version: version,
      path: 'Cart/zoneDetails',
    );
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return List<ZoneDetailsModel>.from(
          result.data.map((model) => ZoneDetailsModel.fromJson(model)));
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<bool?> addToCartDemo({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
  }) async {
    final response = await defaultApi.postData(
        data: cartSkuModel.map((e) => e.toJson()).toList(),
        path: 'profile/cart/AddItem',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? true;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<bool?> updateItemInCartDemo({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
  }) async {
    final response = await defaultApi.postData(
        data: cartSkuModel.map((e) => e.toJson()).toList(),
        path: 'Profile/cart/Add',
        queryParameters: {"CustomerID": customerId});
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return result.data ?? true;
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<void> demoGetCartSummaryWithDiscount({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
    required double discountPercentage,
    int? zoneId,
  }) async {
    await defaultApi.postData(
        data: cartSkuModel.map((e) => e.toJson()).toList(),
        path: 'Profile/cart/Add',
        queryParameters: {
          "CustomerID": customerId,
          "DiscountPercent": customerId,
          "ZoneID": zoneId,
        });
    // final result = ApiReturnResult.fromJSON(response.data);
    // if (result.code == 200) {
    //   return result.data ?? true;
    // } else {
    //   throw ExceptionApi(code: result.code, message: result.error?.first);
    // }
  }

  @override
  Future<CartModelV3> guestCartUpdateV3(
      {required List<CartSkuModel> cartSkuModel}) async {
    final response = await defaultApi.postData(
        data: cartSkuModel, path: "Cart/guest/cart/update", version: 3);
    final result = ApiReturnResult.fromJSON(response.data);
    if (result.code == 200) {
      return CartModelV3.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }
}

abstract class CartService {
  Future<bool?> addToCart(
      {required List<CartSkuModel> cartSkuModel, required int customerId});
  Future<bool?> updateItemInCart(
      {required List<CartSkuModel> cartSkuModel, required int customerId});
  Future<bool?> addToCartDemo(
      {required List<CartSkuModel> cartSkuModel, required int customerId});
  Future<bool?> updateItemInCartDemo(
      {required List<CartSkuModel> cartSkuModel, required int customerId});
  Future<List<CartItemModel>> getCartList({required int customerId});

  /// Update cart in guest user case
  Future<List<CartItemModel>> guestCartUpdate(
      {required List<CartSkuModel> cartSkuModel, int version = 1});

  /// Notify user when booking pre-order product
  ///
  /// Use it in cart page
  Future<PreOrderMessageModel> preOrderMessage({required int customerId});
  Future<int> getCartCounter({required int customerId});
  Future<bool> removeFromCart({required int skuId, required int customerId});

  /// Get all the information about cart for checkout
  Future<CartSummaryModel> getCartSummary(
      {required int customerId, int version = 1});

  /// Called first thing in cart page to get all client's discounts
  Future<String> cartDiscountNotification({required int customerId});

  /// Called first thing in cart page to get all guest's discounts
  Future<String> visitorDiscountNotification(
      {required List<CartSkuModel> cartSkuModel});

  /// Called to get zones with coverage area and coordinates
  Future<List<ZoneDetailsModel>> getZoneDetails({int version = 1});
  Future<void> demoGetCartSummaryWithDiscount({
    required List<CartSkuModel> cartSkuModel,
    required int customerId,
    required double discountPercentage,
    int? zoneId,
  });

  Future<CartModelV3> guestCartUpdateV3(
      {required List<CartSkuModel> cartSkuModel});
}
