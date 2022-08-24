part of 'plants_cubit.dart';

@immutable
abstract class PlantsState {}

class PlantsInitial extends PlantsState {}

class PlantsErrorCase extends PlantsState {}

class PlantsLoaded extends PlantsState {
  final List<Plant> plants;
  PlantsLoaded(this.plants);
}
