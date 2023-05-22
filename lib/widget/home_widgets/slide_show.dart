import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color_manager.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Shimmer.fromColors(
        highlightColor: ColorManager.lightPrimary,
        baseColor: ColorManager.darkPrimary,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    color: ColorManager.lightPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: ColorManager.lightPrimary,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
