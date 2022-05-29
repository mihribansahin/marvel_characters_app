class ComicItemModel {

  String? resoureUri;
  String? comicName; 

  ComicItemModel.fromJson(Map json){
    resoureUri = json['resourceURI'];
    comicName = json['name'];
  }




}