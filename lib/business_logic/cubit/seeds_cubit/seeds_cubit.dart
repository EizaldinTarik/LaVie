import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:la_vie/data/models/products.dart';
import 'package:la_vie/data/models/seeds.dart';

import 'package:la_vie/data/repository/seeds_repository.dart';
part 'seeds_stats.dart';

class SeedsCubit extends Cubit<SeedsState> {
  final SeedsRepository seedsRepository;
  List<Seed> seeds = [];
  SeedsCubit(this.seedsRepository) : super(SeedsInitial());
  List<Seed> getAllSeeds() {
    seedsRepository.getAllSeeds().then((seeds) {
      emit(
        SeedsLoaded(seeds),
      );
      this.seeds = seeds;
    });
    return seeds;
  }
}
