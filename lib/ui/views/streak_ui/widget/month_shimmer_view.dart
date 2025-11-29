import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class MonthStreakShimmer extends StatelessWidget {
  const MonthStreakShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey..withValues(alpha: 0.4),
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            children: [
              VerticalSpaceBox.s5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withValues(alpha: 0.3),
                    highlightColor: Colors.grey.withValues(alpha: 0.6),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  HorizontalSpaceBox.s8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.withValues(alpha: 0.3),
                          highlightColor: Colors.grey..withValues(alpha: 0.6),
                          child: Container(
                            height: 16,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        VerticalSpaceBox.s5,
                        Shimmer.fromColors(
                          baseColor: Colors.grey.withValues(alpha: 0.3),
                          highlightColor: Colors.grey.withValues(alpha: 0.6),
                          child: Container(
                            height: 12,
                            width: 150,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalSpaceBox.s8,
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withValues(alpha: 0.3),
                    highlightColor: Colors.grey.withValues(alpha: 0.6),
                    child: Icon(
                      Icons.calendar_today,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  HorizontalSpaceBox.s8,
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withValues(alpha: 0.3),
                    highlightColor: Colors.grey.withValues(alpha: 0.6),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpaceBox.s8,
              Shimmer.fromColors(
                baseColor: Colors.grey.withValues(alpha: 0.3),
                highlightColor: Colors.grey.withValues(alpha: 0.6),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
