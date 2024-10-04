import 'package:flutter/material.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/horizontal_list_view.dart';
import '../widgets/grid_view_widget.dart';
import '../widgets/dynamic_list_view.dart';
import '../widgets/nested_scroll_layout.dart';
import 'information_screen.dart';
import 'profile_screen.dart';
import 'promotion_screen.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Custom List View'),
            ),
            const CustomListView(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Horizontal List View'),
            ),
            SizedBox(
              height: 200,
              child: HorizontalListView(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Grid View'),
            ),
            SizedBox(
              height: 400,
              child: GridViewWidget(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Dynamic List View'),
            ),
            SizedBox(
              height: 400,
              child: DynamicListView(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Nested Scroll Layout'),
            ),
            SizedBox(
              height: 400,
              child: NestedScrollLayout(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Go to Information',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'Go to Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.local_offer),
              tooltip: 'Go to Promotion',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PromotionScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Go to View Screen',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
