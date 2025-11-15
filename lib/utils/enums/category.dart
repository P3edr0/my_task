import 'package:flutter/material.dart';

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
  leisure;

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

  IconData getIcon() {
    switch (this) {
      case home:
        return Icons.house;
      case work:
        return Icons.business;
      case shopping:
        return Icons.shopping_cart;
      case health:
        return Icons.healing;
      case study:
        return Icons.menu_book;
      case finance:
        return Icons.savings;
      case family:
        return Icons.family_restroom;
      case transport:
        return Icons.directions_car;
      case goals:
        return Icons.flag;
      default:
        return Icons.games;
    }
  }
}
