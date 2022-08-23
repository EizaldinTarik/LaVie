part of 'seeds_cubit.dart';

@immutable
abstract class SeedsState {}

class SeedsInitial extends SeedsState {}

class SeedsErrorCase extends SeedsState {}

class SeedsLoaded extends SeedsState {
  final List<Seed> seeds;
  SeedsLoaded(this.seeds);
}
