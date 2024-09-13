/*
 * @Author: jack ning github@bytedesk.com
 * @Date: 2024-09-13 17:54:38
 * @LastEditors: jack ning github@bytedesk.com
 * @LastEditTime: 2024-09-13 18:16:18
 * @FilePath: /example/lib/main.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_qrcode/flutter_plugin_qrcode.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _qrcode = '二维码扫描';

  @override
  void initState() {
    super.initState();
  }

  Future<void> getQrcodeState() async {
    String qrcode;
    try {
      qrcode = await FlutterPluginQrcode.getQRCode;
    } on PlatformException {
      qrcode = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _qrcode = qrcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter QRCode Plugin example app'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                getQrcodeState();
              },
              child: Text('$_qrcode')),
        ),
      ),
    );
  }
}
