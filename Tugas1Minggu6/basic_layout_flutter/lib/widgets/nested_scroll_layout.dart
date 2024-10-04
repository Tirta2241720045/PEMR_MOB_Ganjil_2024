import 'package:flutter/material.dart';

class NestedScrollLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Item 1'),
                const Text('Item 2'),
                const Text('Item 3'),
              ],
            ),
          ),
        );
      },
    );
  }
}
