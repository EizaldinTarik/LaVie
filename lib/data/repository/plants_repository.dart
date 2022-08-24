import 'package:la_vie/data/models/plants.dart';
import 'package:la_vie/data/web_services/plants_web_services.dart';

class PlantsRepository {
  final PlantsWebServices plantsWebServices;

  PlantsRepository(this.plantsWebServices);
  Future<List<Plant>> getAllPlants() async {
    final plants = await plantsWebServices.getAllPlants();
    return plants.map((plant) => Plant.fromJson(plant)).toList();
  }
}
