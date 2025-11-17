import 'package:flutter/material.dart';
import 'package:my_task/utils/icons.dart';

enum Category {
  home,
  work,
  shopping,
  health,
  study,
  finance,
  family,
  transport,
  goals,
  leisure,
  other;

  bool get isHome => this == home;
  bool get isWork => this == work;
  bool get isShopping => this == shopping;
  bool get isHealth => this == health;
  bool get isStudy => this == study;
  bool get isFinance => this == finance;
  bool get isFamily => this == family;
  bool get isTransport => this == transport;
  bool get isGoals => this == goals;
  bool get isLeisure => this == leisure;
  bool get isOther => this == other;

  IconData getIcon() {
    switch (this) {
      case home:
        return TaskIcons.home;
      case work:
        return TaskIcons.work;
      case shopping:
        return TaskIcons.shopping;
      case health:
        return TaskIcons.health;
      case study:
        return TaskIcons.study;
      case finance:
        return TaskIcons.finance;
      case family:
        return TaskIcons.family;
      case transport:
        return TaskIcons.car;
      case goals:
        return TaskIcons.goal;
      case leisure:
        return TaskIcons.fun;
      default:
        return TaskIcons.others;
    }
  }

  @override
  String toString() {
    switch (this) {
      case home:
        return 'Casa';
      case work:
        return 'Trabalho';
      case shopping:
        return 'Compras';
      case health:
        return 'Saúde';
      case study:
        return 'Estudo';
      case finance:
        return 'Finanças';
      case family:
        return 'Família';
      case transport:
        return 'Transporte';
      case goals:
        return 'Objetivos';
      case leisure:
        return 'Lazer';
      default:
        return 'Outros';
    }
  }
}
