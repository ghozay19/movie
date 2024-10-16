import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../bookmark/page/boomark_page.dart';
import '../../home/page/home_page.dart';

import '../store/dashboard_store.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final dashboardStore = GetIt.I<DashboardStore>();

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with two tabs, sync with the dashboardStore
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // Sync with dashboardStore when tab changes
      if (_tabController.index != dashboardStore.selectedIndex) {
        dashboardStore.setSelectedIndex(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: const [
              HomePage(),
              BookmarkPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dashboardStore.selectedIndex,
            onTap: (index) {
              // Update TabController index on bottom navigation tap
              dashboardStore.setSelectedIndex(index);
              _tabController.animateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmarks',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
