import 'package:la_vie/constants/strings.dart';
import 'package:la_vie/data/models/seeds.dart';
import 'package:la_vie/data/models/products.dart';
import 'package:la_vie/data/web_services/seeds_web_services.dart';

class SeedsRepository {
  final SeedsWebServices seedsWebServices;

  SeedsRepository(this.seedsWebServices);
  Future<List<Seed>> getAllSeeds() async {
    final seeds = await seedsWebServices.getAllSeeds();
    return seeds.map((seed) => Seed.fromJson(seed)).toList();
  }
}
