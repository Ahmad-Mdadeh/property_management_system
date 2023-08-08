import 'package:flutter/material.dart';

class HomePropertyCardShimmer extends StatelessWidget {
  const HomePropertyCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: MediaQuery.of(context).size.height / 2.7,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }
}
