import 'package:pj1/data/default_items.dart';
import 'package:pj1/models/budget/item_template.dart';

class ItemTemplateService {
  // Cache dos templates
  static final List<ItemTemplate> _templates = defaultItems
      .where((item) =>
          item['name'] != null &&
          item['category'] != null &&
          item['availableUnits'] != null &&
          item['defaultUnit'] != null)
      .map((item) => ItemTemplate.fromJson(item))
      .toList();

  // Obter lista de categorias únicas
  static List<String> getCategories() {
    return _templates.map((t) => t.category).toSet().toList()..sort();
  }

  // Pesquisar templates por nome e categoria opcional
  static List<ItemTemplate> searchTemplates(String query, {String? category}) {
    query = query.toLowerCase().trim();

    // Se não houver query, retorna todos os itens da categoria
    if (query.isEmpty) {
      return category != null ? getTemplatesByCategory(category) : _templates;
    }

    // Filtrar itens
    var results = _templates.where((item) {
      // Verificar se pertence à categoria selecionada
      if (category != null && item.category != category) {
        return false;
      }

      // Pesquisar em diferentes campos
      return item.name.toLowerCase().contains(query) || // Nome
          item.category.toLowerCase().contains(query) || // Categoria
          (item.subcategory?.toLowerCase().contains(query) ??
              false); // Subcategoria
    }).toList();

    // Ordenar por relevância
    results.sort((a, b) {
      final aName = a.name.toLowerCase();
      final bName = b.name.toLowerCase();

      // Prioridade 1: Match exato no nome
      if (aName == query) return -1;
      if (bName == query) return 1;

      // Prioridade 2: Nome começa com a query
      if (aName.startsWith(query)) return -1;
      if (bName.startsWith(query)) return 1;

      // Prioridade 3: Ordem alfabética
      return aName.compareTo(bName);
    });

    return results;
  }

  static List<ItemTemplate> getTemplatesByCategory(String category) {
    return _templates.where((item) => item.category == category).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  // Obter subcategorias de uma categoria
  static List<String> getSubcategories(String category) {
    return _templates
        .where((t) => t.category == category)
        .map((t) => t.subcategory ?? '')
        .where((s) => s.isNotEmpty)
        .toSet()
        .toList()
      ..sort();
  }

  // Obter template por nome exato
  static ItemTemplate? getTemplateByName(String name) {
    try {
      return _templates.firstWhere((item) => item.name == name);
    } catch (_) {
      return null;
    }
  }

  // Obter unidades disponíveis para um item
  static List<String> getAvailableUnits(String itemName) {
    final template = getTemplateByName(itemName);
    return template?.availableUnits ?? [];
  }

  // Obter unidade padrão para um item
  static String getDefaultUnit(String itemName) {
    final template = getTemplateByName(itemName);
    return template?.defaultUnit ?? 'un';
  }
}
