import 'package:flutter/material.dart';
import 'package:snooker_manager/features/dashboard/pages/widgets/tableContent.dart';
import 'billiard_table_widget.dart';

class TablesGrid extends StatelessWidget {
  final int tableCount;

  const TablesGrid({super.key, required this.tableCount});

  @override
  Widget build(BuildContext context) {
    // final double itemWidth = MediaQuery.of(context).size.height;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: tableCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 360,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text("Table ${index + 1}"),
            const SizedBox(height: 1),
            Expanded(
              child: PoolTableWidget(child: TableContent(index: index)),
            ),
          ],
        );
      },
    );
  }
}
