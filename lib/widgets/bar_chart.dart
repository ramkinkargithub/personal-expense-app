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
        Container(
          color: Colors.black,
          // decoration: BoxDecoration(
          //   border: Border.all(width: 2),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          height: 160,
          width: 60,
          child: Center(
            child: Container(
              height: 150,
              width: 50,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    color: Colors.red,
                  ),
                  Container(
                    height: (1 - spendingPctOfTotal) * 150,
                    color: Colors.white,
                  )
                ],
              ),
            ),
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
