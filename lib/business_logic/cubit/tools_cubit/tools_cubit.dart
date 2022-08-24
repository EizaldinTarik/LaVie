import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:la_vie/data/models/tools.dart';
import 'package:la_vie/data/repository/tools_repository.dart';

part 'tools_stats.dart';

class ToolsCubit extends Cubit<ToolsState> {
  final ToolsRepository toolsRepository;
  List<Tool> tools = [];
  ToolsCubit(this.toolsRepository) : super(ToolsInitial());
  List<Tool> getAllTools() {
    toolsRepository.getAllTools().then((tools) {
      emit(
        ToolsLoaded(tools),
      );
      this.tools = tools;
    });
    return tools;
  }
}
