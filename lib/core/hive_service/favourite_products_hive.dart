import 'package:pyramakerz/core/hive_service/hive_service.dart';
import 'package:pyramakerz/features/products/data/models/product_model.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';

class FavouritesHive {
  FavouritesHive._();

  static String _favouritesKey(String userId) => 'userFavorites_$userId';

  static Future<void> addToFavourites(String userId, Product product) async {
    final key = _favouritesKey(userId);

    final List<Product> existing = await getFavourites(userId);

    final alreadyFavourite = existing.any((item) => item.id == product.id);

    if (!alreadyFavourite) {
      existing.add(product);

      await HiveService.putMap(
        key: key,
        value: {
          'items': existing.map((e) => (e as ProductModel).toJson()).toList(),
        },
      );
    }
  }

  static Future<void> removeFromFavourites(String userId, int productId) async {
    final key = _favouritesKey(userId);

    final List<Product> existing = await getFavourites(userId);
    existing.removeWhere((item) => item.id == productId);

    await HiveService.putMap(
      key: key,
      value: {
        'items': existing.map((e) => (e as ProductModel).toJson()).toList(),
      },
    );
  }

  static Future<List<Product>> getFavourites(String userId) async {
    final key = _favouritesKey(userId);
    final data = await HiveService.getMap(key: key);

    if (data is Map<String, dynamic> && data['items'] is List<dynamic>) {
      return (data['items'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    return [];
  }

  static Future<bool> isFavourite(String userId, int productId) async {
    final favourites = await getFavourites(userId);
    return favourites.any((item) => item.id == productId);
  }
}
