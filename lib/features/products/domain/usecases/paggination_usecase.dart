import 'package:injectable/injectable.dart';
import 'package:pyramakerz/features/products/domain/entities/product.dart';

@injectable
class PaginateProducts {
  List<Product> call({
    required List<Product> products,
    required int currentPage,
    required int itemsPerPage,
  }) {
    final start = currentPage * itemsPerPage;
    final end = start + itemsPerPage;

    if (start >= products.length) return [];

    return products.sublist(
      start,
      end > products.length ? products.length : end,
    );
  }
}
