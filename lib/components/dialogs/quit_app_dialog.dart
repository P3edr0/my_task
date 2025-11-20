import 'package:flutter/material.dart';
import 'package:my_task/presenter/new_task/components/button.dart';

class QuitAppDialog {
  const QuitAppDialog();

  static Future<bool> show(
    String title,
    String content,
    BuildContext context,
  ) async {
    return await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title, textAlign: TextAlign.center),
            content: Text(content, textAlign: TextAlign.center),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TaskButton(
                onTap: () => Navigator.of(context).pop(false),
                title: "Voltar",
              ),
              TaskButton(
                onTap: () => Navigator.of(context).pop(true),

                title: "Sair",
              ),
            ],
          ),
    );
  }

  static Future closeAuto(
    String title,
    String content,
    BuildContext context,
  ) async {
    return await showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Durations.extralong4, () {
          if (context.mounted) {
            Navigator.of(context).pop(false);
          }
        });
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content, textAlign: TextAlign.center),
        );
      },
    );
  }
}
