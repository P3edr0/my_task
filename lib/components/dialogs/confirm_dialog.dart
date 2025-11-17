import 'package:flutter/material.dart';
import 'package:my_task/tarefa_project/new_task/components/button.dart';

class ConfirmDialog {
  const ConfirmDialog();

  static Future<bool?> show(
    String title,
    String content,
    BuildContext context,
    VoidCallback confirmCallback,
  ) async {
    return await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title, textAlign: TextAlign.center),
            content: Text(content, textAlign: TextAlign.center),
            actions: [
              TaskButton(
                onTap: () => Navigator.of(context).pop(),
                title: "Voltar",
              ),
              TaskButton(onTap: confirmCallback, title: "Confirmar"),
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
