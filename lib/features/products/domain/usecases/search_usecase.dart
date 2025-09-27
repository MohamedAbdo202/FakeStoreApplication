import 'package:injectable/injectable.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';

@injectable
class SearchProductsLocally {
  List<Product> call({
    required List<Product> products,
    required String? query,
  }) {
    if (query == null || query.isEmpty) return products;

    return products
        .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
