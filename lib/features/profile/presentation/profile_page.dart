import 'package:flutter/material.dart';

/// 我的页占位，后续可扩展用户资料与设置
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person_outline),
              ),
              title: const Text('未登录用户'),
              subtitle: const Text('登录后同步数据'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('登录'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _ProfileItem(icon: Icons.lock_outline, label: '安全中心'),
          const _ProfileItem(icon: Icons.settings_outlined, label: '设置'),
          const _ProfileItem(icon: Icons.help_outline, label: '帮助与反馈'),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
