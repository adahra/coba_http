import 'package:coba_http/presentation/home/album_model.dart';
import 'package:coba_http/presentation/home/providers/album_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AlbumProvider provider = Get.put(AlbumProvider());

  Future<Album?> fetchAlbum() {
    return provider.getAlbum(1);
  }
}
