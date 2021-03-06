import 'package:linktsp_api/data/page_block/models/new_page_block_model.dart';

class MenuModel {
  MenuModel({
    this.length,
    this.items,
  });

  int? length;
  List<Item>? items;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        length: json["length"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.childern,
    this.listType,
    this.imgUrl,
    this.imgThumbUrl,
    this.hasFilter,
    this.listTypeName,
    this.listTypeID,
    this.filterModel,
  });

  int? id;
  String? name;
  List<Item>? childern;
  int? listType;
  String? imgUrl;
  String? imgThumbUrl;
  bool? hasFilter;
  String? listTypeName;
  int? listTypeID;
  FilterModel? filterModel;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        childern: json["childern"] == null
            ? null
            : List<Item>.from(json["childern"].map((x) => Item.fromJson(x))),
        listType: json["listType"],
        imgUrl: json["imgURL"],
        imgThumbUrl: json["imgThumbURL"],
        hasFilter: json["hasFilter"],
        listTypeName: json["listTypeName"],
        listTypeID: json["listTypeID"],
        filterModel: json["filterModel"] == null
            ? null
            : FilterModel.fromJson(json["filterModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "childern": childern == null
            ? null
            : List<dynamic>.from(childern!.map((x) => x.toJson())),
        "listType": listType,
        "imgURL": imgUrl,
        "imgThumbURL": imgThumbUrl,
        "hasFilter": hasFilter,
        "listTypeName": listTypeName,
        "listTypeID": listTypeID,
        "filterModel": filterModel == null ? null : filterModel!.toJson(),
      };
}

class ContactInfoModel {
  ContactInfoModel({
    this.value,
    this.url,
    this.socialType,
  });

  String? value;
  String? url;
  int? socialType;

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) =>
      ContactInfoModel(
        value: json["value"],
        url: json["url"],
        socialType: json["socialType"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "url": url,
        "socialType": socialType,
      };
}
