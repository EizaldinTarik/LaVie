import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:la_vie/data/models/plants.dart';
import 'package:la_vie/data/repository/plants_repository.dart';
part 'plants_stats.dart';

class PlantsCubit extends Cubit<PlantsState> {
  final PlantsRepository plantsRepository;
  List<Plant> plants = [];
  PlantsCubit(this.plantsRepository) : super(PlantsInitial());
  List<Plant> getAllPlants() {
    plantsRepository.getAllPlants().then((plants) {
      emit(
        PlantsLoaded(plants),
      );
      this.plants = plants;
    });
    return plants;
  }
}
