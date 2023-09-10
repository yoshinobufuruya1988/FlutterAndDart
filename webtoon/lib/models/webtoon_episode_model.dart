// class WebtoonEpisodeModel {
//   final String id, title, raiting, date;

//   WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
//       : title = json["id"],
//         about = json["title"],
//         genre = json["raiting"],
//         age = json["date"];
// }

class WebtoonEpisodeModel {
  final String id, title, raiting, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        raiting = json["raiting"],
        date = json["date"];
}
