import 'package:hive/hive.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class ProductHiveService {
  static const String _boxName = 'productBox';

  Future<Box<ProductEntity>> _openBox() async {
    return await Hive.openBox<ProductEntity>(_boxName);
  }

  Future<List<ProductEntity>> getProductList() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addProduct(ProductEntity product) async {
    final box = await _openBox();
    final existingIndex = box.values.toList().indexWhere((p) => p.id == product.id);
    if (existingIndex == -1) {
      await box.add(product);
    }
  }

  Future<void> updateProduct(ProductEntity updatedProduct) async {
    final box = await _openBox();
    final key = box.keys.cast<dynamic>().firstWhere(
          (k) => box.get(k)?.id == updatedProduct.id,
      orElse: () => null,
    );
    if (key != null) {
      await box.put(key, updatedProduct);
    }
  }

  Future<void> updateProductCount(int id, int newCount) async {
    final box = await _openBox(); // box is Box<ProductEntity>
    final key = box.keys.cast<dynamic>().firstWhere(
          (k) => box.get(k)?.id == id,
      orElse: () => null,
    );

    if (key != null) {
      final existing = box.get(key);
      if (existing != null) {
        final updated = existing.copyWith(cartCount: newCount);
        await box.put(key, updated);
      }
    }
  }


  Future<void> deleteProduct(int productId) async {
    final box = await _openBox();
    final key = box.keys.cast<dynamic>().firstWhere(
          (k) => box.get(k)?.id == productId,
      orElse: () => null,
    );
    if (key != null) {
      await box.delete(key);
    }
  }

  Future<void> deleteProductList() async {
    final box = await _openBox();
    await box.clear();
  }
}
