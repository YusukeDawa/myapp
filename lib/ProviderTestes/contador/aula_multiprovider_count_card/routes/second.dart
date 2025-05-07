import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/ProviderTestes/contador/aula_multiprovider_count_card/state/cart.dart';
import 'package:myapp/ProviderTestes/contador/aula_multiprovider_count_card/state/count.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Provider App (${context.watch<Count>().count})'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Itens no carrinho: ${cartProvider.count}'),
          Expanded(
            child: AnimatedList(
              key: cartProvider.listKey,
              initialItemCount: cartProvider.cart.length,
              itemBuilder: (context, index, animation) {
                final item = cartProvider.cart[index];
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    child: ListTile(
                      title: Text(item),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () =>
            context.read<Cart>().addItem('novo item ❤'),
        tooltip: 'Adicionar novo item!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
