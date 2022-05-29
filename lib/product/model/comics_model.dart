import 'comic_item_model.dart';

class ComicModel {
  int? available;
 List< ComicItemModel> ?comicItem;

  ComicModel.fromJson(Map json) {
    available = json['available'];
    comicItem = (json['items'] ?? []).map((c) =>ComicItemModel.fromJson(c)).toList().cast<ComicItemModel>();
  }
}
