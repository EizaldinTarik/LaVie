part of 'tools_cubit.dart';

@immutable
abstract class ToolsState {}

class ToolsInitial extends ToolsState {}

class ToolsErrorCase extends ToolsState {}

class ToolsLoaded extends ToolsState {
  final List<Tool> tools;
  ToolsLoaded(this.tools);
}
