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
            const SizedBox(height: 16),
            Text('lỗi:💕 ${statusCode ?? 'Unknown'} 💕.',
            style: const TextStyle( fontSize: 20),
            ),
            const Text(
              ':)) erro ! bệnh lâu năm của project hãy kiểm tra nó trước.',
              style: TextStyle(color: Colors.red),
            ),
            const Text(
              'lỗi thường gặp:',
              style: TextStyle(color: Colors.red),
            ),
            const Text(
              'bằng cách thần bí nào đó user đã đăng nhập 2 lần kiến cho cookie bị lập !',
              style: TextStyle(color: Colors.red),
            ),
            const Text(
              'kiểm tra bằng cách xem log in danh sách cookie',
              style: TextStyle(color: Colors.red),
            ),
            const Text(
              'lỗi ở backend nên ko cần cố fix nó !',
              style: TextStyle(color: Colors.red),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
