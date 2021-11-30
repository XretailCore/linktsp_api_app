import 'package:linktsp_api/data/apis/Menu/models/menu_model.dart';
import 'package:linktsp_api/data/apis/default_api.dart';
import 'package:linktsp_api/data/apis/result_model.dart';

class MenuWebServicesImp extends DefaultApi implements MenuWebServices {
  MenuWebServicesImp({String defaultPath = ''}) : super(defaultPath);
  @override
  Future<MenuModel> getMenu({required int customerID, int lang = 1}) async {
    final respose = await getData(
      path: 'home/menu',
      queryParameters: {
        'CustomerID': customerID,
        'lang': lang,
      },
    );
    final result = ApiReturnResult.fromJSON(respose.data);
    if (result.code == 200) {
      return MenuModel.fromJson(result.data);
    } else {
      throw Exception(result.error?.first);
    }
  }

  @override
  Future getContactInfo() async {}
  @override
  Future getPreOrderPolicy() async {}
}

abstract class MenuWebServices {
  Future<MenuModel> getMenu({required int customerID, int lang = 1});
  Future getContactInfo();

  Future getPreOrderPolicy();
}
