import 'package:flutter_test/flutter_test.dart';
import 'package:linktsp_api/linktsp_api.dart';

import '../../const.dart';

void main() async {
  await LinkTspApi.init(domin: domin);
  final LinkTspApi linkTspApi = LinkTspApi();
  final service = linkTspApi.list;
  group('Content page service :', () {
    test('get Filter option data is successed', () async {
      // try {
      //   await service.getFilterOptionsData(listModel: listModel);
      //   expect(true, true);
      // } catch (e) {
      //   expect(true, false);
      // }
    });
  });
}
