import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class CustomScreenshotController {
  final ScreenshotController _screenshotController = ScreenshotController();

  ScreenshotController get screenshotController => _screenshotController;

  Future<Uint8List?> captureFromWidget(
      BuildContext context, Widget widget) async {
    return await _screenshotController.captureFromWidget(
      Material(
        child: MediaQuery(
          data: MediaQuery.of(context),
          child: Theme(
            data: Theme.of(context),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: widget,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      context: context,
      delay: const Duration(milliseconds: 500),
      targetSize: Size(
        MediaQuery.of(context).size.width * 5,
        MediaQuery.of(context).size.height *
            5, // Aumentado para caber mais conteúdo
      ),
    );
  }
}
