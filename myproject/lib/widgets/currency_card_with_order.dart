import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'currency_card.dart';

class CurrencyCardWithOrder extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  const CurrencyCardWithOrder({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        0,
        (-30 * order).toDouble(),
      ),
      child: CurrencyCard(
        name: name,
        code: code,
        amount: amount,
        icon: icon,
        isInverted: isInverted,
      ),
    );
  }
}
