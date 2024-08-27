import 'package:flutter/material.dart';

Widget errbody(int? statusCode) => SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('hê hê lỗi ròi kìa ! -⁠ ＜(´⌯  ̫⌯`)＞'),
            const SizedBox(height: 16),
            Text('lỗi:💕 ${statusCode ?? 'Unknown'} 💕.',
            style: const TextStyle( fontSize: 20),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
