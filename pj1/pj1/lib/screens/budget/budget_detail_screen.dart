import 'package:flutter/material.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/budget_location.dart';
import 'package:pj1/services/budget_service.dart';
import 'package:pj1/services/price_alert_service.dart';
import 'package:pj1/services/price_history_service.dart';
import 'package:pj1/widgets/budget/add_item_form.dart';
import 'package:pj1/widgets/budget/budget_item_card.dart';
import 'package:pj1/widgets/budget/budget_summary_card.dart';
import 'package:uuid/uuid.dart';

class BudgetDetailScreen extends StatefulWidget {
  final Budget budget;

  const BudgetDetailScreen({super.key, required this.budget});

  @override
  BudgetDetailScreenState createState() => BudgetDetailScreenState();
}

class BudgetDetailScreenState extends State<BudgetDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BudgetService _budgetService;
  late PriceHistoryService _historyService;
  late PriceAlertService _alertService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _budgetService = BudgetService(userId: widget.budget.userId);
    _historyService = PriceHistoryService(userId: widget.budget.userId);
    _alertService = PriceAlertService();
    _alertService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.budget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.compare_arrows),
            onPressed: () => Navigator.pushNamed(
              context,
              '/budget/compare',
              arguments: widget.budget,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Locais'),
            Tab(text: 'Itens'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Resumo no topo
          BudgetSummaryCard(
            summary: widget.budget.summary,
            title: 'Resumo do Orçamento',
          ),

          // Conteúdo das tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLocationsTab(),
                _buildItemsTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_budget_item', // Adicione esta linha
        onPressed: () {
          if (_tabController.index == 0) {
            _showAddLocationDialog();
          } else {
            _showAddItemDialog();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLocationsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.budget.locations.length,
      itemBuilder: (context, index) {
        final location = widget.budget.locations[index];
        return Card(
          child: ListTile(
            title: Text(location.name),
            subtitle: Text(location.address),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _removeLocation(location.id),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemsTab() {
    Map<String, String> locationNames = {
      for (var loc in widget.budget.locations) loc.id: loc.name
    };

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.budget.items.length,
      itemBuilder: (context, index) {
        final item = widget.budget.items[index];
        return BudgetItemCard(
          item: item,
          locationNames: locationNames,
          budgetId: widget.budget.id,
          historyService: _historyService,
          budget: widget.budget, // Adicionar esta linha
          onDelete: () => _removeItem(item.id),
          onPriceUpdate: (locationId, price) =>
              _updateItemPrice(item.id, locationId, price),
        );
      },
    );
  }

  Future<void> _showAddLocationDialog() async {
    final nameController = TextEditingController();
    final addressController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar Local'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Local',
                hintText: 'Ex: Supermercado A',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Endereço',
                hintText: 'Ex: Rua X, 123',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                final location = BudgetLocation(
                  id: const Uuid().v4(),
                  name: nameController.text.trim(),
                  address: addressController.text.trim(),
                  priceDate: DateTime.now(),
                );
                _addLocation(location);
                Navigator.pop(context);
              }
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddItemDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar Item'),
        content: AddItemForm(
          onItemAdded: (item) async {
            await _addItem(item);
            if (mounted) Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future<void> _addLocation(BudgetLocation location) async {
    await _budgetService.addLocation(widget.budget.id, location);
    setState(() {
      widget.budget.addLocation(location);
    });
  }

  Future<void> _removeLocation(String locationId) async {
    await _budgetService.removeLocation(widget.budget.id, locationId);
    setState(() {
      widget.budget.removeLocation(locationId);
    });
  }

  Future<void> _addItem(BudgetItem item) async {
    await _budgetService.addItem(widget.budget.id, item);
    setState(() {
      widget.budget.addItem(item);
    });
  }

  Future<void> _removeItem(String itemId) async {
    await _budgetService.removeItem(widget.budget.id, itemId);
    setState(() {
      widget.budget.removeItem(itemId);
    });
  }

  Future<void> _updateItemPrice(
      String itemId, String locationId, double price) async {
    try {
      print('Tentando atualizar preço:');
      print('Item: $itemId');
      print('Local: $locationId');
      print('Preço: $price');

      final variation = await _budgetService.updateItemPrice(
        widget.budget.id,
        itemId,
        locationId,
        price,
      );

      setState(() {
        final item =
            widget.budget.items.firstWhere((item) => item.id == itemId);
        item.prices[locationId] = price;
        item.updateBestPrice();
        widget.budget.updateSummary();
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Preço atualizado com sucesso! Variação: ${variation.toStringAsFixed(2)}%'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Erro ao atualizar preço: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao atualizar preço: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
