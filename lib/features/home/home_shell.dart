import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../charts/presentation/charts_page.dart';
import '../discover/presentation/discover_page.dart';
import '../overview/presentation/overview_page.dart';
import '../profile/presentation/profile_page.dart';
import '../records/presentation/record_sheet.dart';

/// 首页骨架，统一底部导航与悬浮按钮
class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _currentIndex = 0;

  final _pages = const [
    OverviewPage(),
    ChartsPage(),
    DiscoverPage(),
    ProfilePage(),
  ];

  final _items = const [
    _BottomNavItem(icon: Icons.view_list_rounded, label: '明细'),
    _BottomNavItem(icon: Icons.pie_chart_outline, label: '图表'),
    _BottomNavItem(icon: Icons.explore_outlined, label: '发现'),
    _BottomNavItem(icon: Icons.person_outline, label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => RecordSheet.show(context, ref),
        child: const Icon(Icons.add, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isSelected = _currentIndex == index;
              final color =
                  isSelected ? const Color(0xFF7C4DFF) : Colors.grey[600];
              return Expanded(
                child: InkWell(
                  onTap: () => setState(() => _currentIndex = index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.icon, color: color, size: 22),
                        const SizedBox(height: 2),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem {
  const _BottomNavItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
