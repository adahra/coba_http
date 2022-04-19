import 'dart:convert';

import 'package:get/get.dart';

import '../album_model.dart';

class AlbumProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Album.fromJson(map);
      if (map is List) return map.map((item) => Album.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
  }

  Future<Album?> getAlbum(int id) async {
    final response = await get('albums/$id');
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
