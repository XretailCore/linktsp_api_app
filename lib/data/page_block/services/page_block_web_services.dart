import 'package:linktsp_api/data/default_api.dart';
import 'package:linktsp_api/data/page_block/models/new_page_block_model.dart';
import 'package:linktsp_api/data/page_block/models/page_block_model.dart';
import 'package:linktsp_api/data/page_block/models/ribbon/ribbon_model.dart';

import '../../exception_api.dart';
import '../../result_model.dart';

class PageBlockWebServiceImp implements PageBlockWebService {
  PageBlockWebServiceImp({required this.defaultApi});
  final DefaultApi defaultApi;

  @override
  Future<PageBlockModel> getPageBlock(
      {int? customerId, int version = 1}) async {
    final respose = await defaultApi
        .getData(path: 'home', version: version, queryParameters: {
      'CustomerID': customerId,
    });
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return PageBlockModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<NewPageBlockModel> getNewPageBlock(
      {int? customerId, int version = 1}) async {
    final respose = await defaultApi
        .getData(path: 'PageBlock/home', version: version, queryParameters: {
      'CustomerID': customerId,
    });
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return NewPageBlockModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<PageBlockModel> getEditorialContent(
      {int? customerId, int version = 1}) async {
    final respose = await defaultApi
        .getData(path: 'Editorial', version: version, queryParameters: {
      'CustomerID': customerId,
    });
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return PageBlockModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<NewPageBlockModel> newGetEditorialContent(
      {int? customerId, int version = 1}) async {
    final respose = await defaultApi.getData(
        path: 'PageBlock/Editorial',
        version: version,
        queryParameters: {
          'CustomerID': customerId,
        });
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return NewPageBlockModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<List<BrandsModel>> getBrands() async {
    final respose =
        await defaultApi.getData(path: 'PageBlock/GetBrands', version: 3);
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return (result.data["brands"] as List)
          .map((e) => BrandsModel.fromJson(e))
          .toList();
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }

  @override
  Future<List<RibbonModel>> ribbon({int version = 1}) async {
    final respose = await defaultApi.getData(path: 'Ribbon', version: version);
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      final list = result.data as List? ?? [];
      return list.map((e) => RibbonModel.fromJson(e)).toList();
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }
}

abstract class PageBlockWebService {
  /// Creates home screen data ( Ex: banners, sliders and posters ).
  /// It's return [PageBlockModel]
  Future<PageBlockModel> getPageBlock({int? customerId, int version = 1});
  Future<NewPageBlockModel> getNewPageBlock({int? customerId, int version = 1});
  Future<NewPageBlockModel> newGetEditorialContent(
      {int? customerId, int version = 1});
  Future<PageBlockModel> getEditorialContent(
      {int? customerId, int version = 1});
  Future<List<BrandsModel>> getBrands();
  Future<List<RibbonModel>> ribbon();
}
