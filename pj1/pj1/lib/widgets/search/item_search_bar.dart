import 'package:flutter/material.dart';
import 'package:pj1/controller/item_search_controller.dart';
import 'package:pj1/models/budget/budget_item.dart';

class ItemSearchBar extends StatefulWidget {
  final List<BudgetItem> items;
  final Function(BudgetItem) onItemSelected;

  const ItemSearchBar({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<ItemSearchBar> createState() => _ItemSearchBarState();
}

class _ItemSearchBarState extends State<ItemSearchBar> {
  late ItemSearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ItemSearchController(widget.items);
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Autocomplete<BudgetItem>(
        displayStringForOption: (item) => item.name,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<BudgetItem>.empty();
          }
          return widget.items.where((item) => item.name
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
        },
        onSelected: (item) {
          widget.onItemSelected(item);
          _controller.clear();
          FocusScope.of(context).unfocus();
        },
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: 'Buscar item...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    final matches = widget.items.where((item) => item.name
                        .toLowerCase()
                        .contains(controller.text.toLowerCase()));
                    if (matches.isNotEmpty) {
                      widget.onItemSelected(matches.first);
                      controller.clear();
                      focusNode.unfocus();
                    }
                  }
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = options.elementAt(index);
                    return ListTile(
                      title: Text(option.name),
                      subtitle: option.unit != 'un'
                          ? Text('${option.quantity} ${option.unit}')
                          : null,
                      onTap: () => onSelected(option),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
