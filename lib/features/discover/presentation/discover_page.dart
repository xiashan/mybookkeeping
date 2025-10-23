import 'package:flutter/material.dart';

/// 发现页占位，后续可扩展资讯、攻略等内容
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发现'),
      ),
      body: const Center(
        child: Text('敬请期待更多发现内容'),
      ),
    );
  }
}
