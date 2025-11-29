import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class AnalyticsShimmer extends StatelessWidget {
  const AnalyticsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Shimmer for Section Header
        Shimmer.fromColors(
          baseColor: AppColors.iceBlue.withOpacity(0.2),
          highlightColor: AppColors.iceBlue.withOpacity(0.5),
          child: Container(
            height: 24,
            width: 150,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 16),
          ),
        ),

        // Shimmer for Metrics Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(2, (index) {
            return Shimmer.fromColors(
              baseColor: AppColors.iceBlue.withOpacity(0.2),
              highlightColor: AppColors.iceBlue.withOpacity(0.5),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 16),
              ),
            );
          }),
        ),

        HorizontalSpaceBox.s24,

        // Shimmer for Graph
        Shimmer.fromColors(
          baseColor: AppColors.iceBlue.withOpacity(0.2),
          highlightColor: AppColors.iceBlue.withOpacity(0.5),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        HorizontalSpaceBox.s24,
      ],
    );
  }
}
