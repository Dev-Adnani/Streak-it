import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/upcoming_features/model/feature.model.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'upcoming_features_viewmodel.dart';

class UpcomingFeaturesView extends StackedView<UpcomingFeaturesViewModel> {
  const UpcomingFeaturesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UpcomingFeaturesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        iconData: IconlyLight.arrowLeft,
        iconColor: AppColors.creamColor,
        title: "Upcoming Features",
        onPressed: () {
          viewModel.goBack();
        },
      ),
      body: viewModel.isBusy
          ? _buildShimmerEffect()
          : viewModel.data == null || viewModel.data!.isEmpty
              ? const Center(child: Text('No features available.'))
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            FuturePlans(features: viewModel.data!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3, // Number of shimmer items to display
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[500]!,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    VerticalSpaceBox.s8,
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.grey,
                    ),
                  ],
                ),
                HorizontalSpaceBox.s16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: Colors.grey,
                      ),
                      VerticalSpaceBox.s8,
                      Container(
                        height: 12,
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.grey,
                      ),
                      VerticalSpaceBox.s5,
                      Container(
                        height: 12,
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  UpcomingFeaturesViewModel viewModelBuilder(BuildContext context) =>
      UpcomingFeaturesViewModel();
}

class FuturePlans extends StatelessWidget {
  final List<Feature> features;

  const FuturePlans({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s Coming Next?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        VerticalSpaceBox.s16,
        ...features.asMap().entries.map((entry) {
          int index = entry.key; // Zero-based index
          bool isLast =
              index == features.length - 1; // Check if it's the last item
          Feature feature = entry.value;
          return _buildTimelineItem(
            context: context,
            feature: feature,
            index: index + 1,
            isLast: isLast,
          );
        }),
      ],
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required Feature feature,
    required int index,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.iceBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.iceBlue,
                  ),
                ),
            ],
          ),
          HorizontalSpaceBox.s16,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpaceBox.s8,
                  Text(
                    feature.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
