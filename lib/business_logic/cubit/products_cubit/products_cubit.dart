import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:la_vie/data/models/products.dart';
import 'package:la_vie/data/repository/products_repository.dart';
part 'products_stats.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository productsRepository;
  List<Product> products = [];
  ProductsCubit(this.productsRepository) : super(ProductsInitial());
  List<Product> getAllProducts() {
    productsRepository.getAllProducts().then((products) {
      emit(
        ProductsLoaded(products),
      );
      this.products = products;
    });
    return products;
  }
}
