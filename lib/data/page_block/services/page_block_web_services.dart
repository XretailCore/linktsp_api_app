import 'package:linktsp_api/data/default_api.dart';
import 'package:linktsp_api/data/page_block/models/page_block_model.dart';

import '../../exception_api.dart';
import '../../result_model.dart';

class PageBlockWebServicesImp extends DefaultApi
    implements PageBlockWebServices {
  PageBlockWebServicesImp({String defaultPath = ''}) : super(defaultPath);

  @override
  Future<PageBlockModel> getPageBlock() async {
    final respose = await getData(
      path: 'home',
    );
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return PageBlockModel.fromJson(result.data);
    } else {
      throw ExceptionApi(code: result.code, message: result.error?.first);
    }
  }
}

abstract class PageBlockWebServices {
  Future<PageBlockModel> getPageBlock();
}