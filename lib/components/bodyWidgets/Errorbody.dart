// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Errbody(int? statusCode) => SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('hê hê lỗi ròi kìa ! -⁠ ＜(´⌯  ̫⌯`)＞'),
            const SizedBox(height: 8),
            Text('lỗi:💕 ${statusCode ?? 'Unknown'} 💕.'),
            const Text(
              'em chưa :)) erro !',
              style: TextStyle(color: Colors.red),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
