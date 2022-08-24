import 'package:la_vie/data/models/tools.dart';
import 'package:la_vie/data/web_services/tools_web_services.dart';

class ToolsRepository {
  final ToolsWebServices toolsWebServices;

  ToolsRepository(this.toolsWebServices);
  Future<List<Tool>> getAllTools() async {
    final tools = await toolsWebServices.getAllTools();
    return tools.map((tool) => Tool.fromJson(tool)).toList();
  }
}
