import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/data/default_items.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/services/budget_service.dart';
import 'package:pj1/utils/budget_utils.dart';

class BudgetListScreen extends StatefulWidget {
  final User user;

  const BudgetListScreen({
    super.key,
    required this.user,
  });

  @override
  State<BudgetListScreen> createState() => _BudgetListScreenState();
}

class _BudgetListScreenState extends State<BudgetListScreen> {
  late BudgetService _budgetService;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final _searchController = TextEditingController();
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Orçamentos'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/home'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Pesquisa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar produtos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),

          // Filtro por Categoria
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Todos'),
                  selected: _selectedCategory == null,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = null;
                    });
                  },
                ),
                ...defaultItems.map((e) => e['category'] as String).toSet().map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: FilterChip(
                          label: Text(category),
                          selected: _selectedCategory == category,
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = selected ? category : null;
                            });
                          },
                        ),
                      ),
                    ),
              ],
            ),
          ),

          // Lista de Orçamentos Filtrada
          Expanded(
            child: StreamBuilder<List<Budget>>(
              stream: _budgetService.getBudgets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                }

                var budgets = snapshot.data ?? [];

                // Aplicar filtros
                if (_searchController.text.isNotEmpty) {
                  final searchResults =
                      BudgetUtils.searchProducts(_searchController.text);
                  budgets = budgets.where((budget) {
                    return budget.items.any((item) => searchResults
                        .any((result) => result['name'] == item.name));
                  }).toList();
                }

                if (_selectedCategory != null) {
                  budgets = budgets.where((budget) {
                    return budget.items
                        .any((item) => item.category == _selectedCategory);
                  }).toList();
                }

                if (budgets.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Nenhum orçamento encontrado',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: budgets.length,
                  itemBuilder: (context, index) {
                    final budget = budgets[index];
                    return _BudgetCard(
                      budget: budget,
                      onTap: () => _navigateToBudgetDetail(budget),
                      onDelete: () => _deleteBudget(budget),
                      currencyFormat: currencyFormat,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_budget', // Adicione esta linha
        onPressed: () => _showCreateBudgetDialog(context),
        label: const Text('Novo Orçamento'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _budgetService = BudgetService(userId: widget.user.uid);
  }

  Future<void> _showCreateBudgetDialog(BuildContext context) async {
    final titleController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo Orçamento'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Título do Orçamento',
            hintText: 'Ex: Compras do Mês',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              if (titleController.text.isNotEmpty) {
                try {
                  final budget = await _budgetService.createBudget(
                    titleController.text.trim(),
                  );
                  if (context.mounted) {
                    Navigator.pop(context); // Fecha o diálogo
                    _navigateToBudgetDetail(budget); // Navega para detalhes
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Orçamento criado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erro ao criar orçamento: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }
            },
            child: const Text('Criar'),
          ),
        ],
      ),
    );
  }

  void _navigateToBudgetDetail(Budget budget) {
    Navigator.pushNamed(
      context,
      '/budget/detail',
      arguments: budget,
    );
  }

  Future<void> _deleteBudget(Budget budget) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Orçamento'),
        content: const Text(
          'Tem certeza que deseja excluir este orçamento? Esta ação não pode ser desfeita.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _budgetService.deleteBudget(budget.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Orçamento excluído com sucesso'),
          ),
        );
      }
    }
  }
}

class _BudgetCard extends StatelessWidget {
  final Budget budget;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final NumberFormat currencyFormat;

  const _BudgetCard({
    required this.budget,
    required this.onTap,
    required this.onDelete,
    required this.currencyFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      budget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: onDelete,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Criado em: ${DateFormat('dd/MM/yyyy').format(budget.date)}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoColumn(
                    label: 'Total Original',
                    value: currencyFormat.format(budget.summary.totalOriginal),
                    color: Colors.grey[700]!,
                  ),
                  _InfoColumn(
                    label: 'Melhor Preço',
                    value: currencyFormat.format(budget.summary.totalOptimized),
                    color: Colors.green[700]!,
                  ),
                  _InfoColumn(
                    label: 'Economia',
                    value: currencyFormat.format(budget.summary.savings),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _InfoColumn({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
