import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  BarChart(this.label, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '₹${spendingAmount.toString()}',
          style: Theme.of(context).textTheme.headline6,
        ),
        Card(
          color: Colors.green,
          shadowColor: Colors.white,
          child: Stack(
            children: [
              Container(
                height: 250,
                color: Colors.amber,
              ),
              Container(
                height: (1 - spendingPctOfTotal) * 250,
                color: Colors.white,
              )
            ],
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
