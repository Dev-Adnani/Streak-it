import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/support_developer/support_developer_viewmodel.dart';
import 'package:streakit/ui/views/support_developer/widgets/developer_info.dart';
import 'package:streakit/ui/views/support_developer/widgets/gratitude_card.dart';
import 'package:streakit/ui/views/support_developer/widgets/support_options.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';

class SupportDeveloperView extends StackedView<SupportDeveloperViewModel> {
  const SupportDeveloperView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SupportDeveloperViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        iconData: IconlyLight.arrowLeft,
        iconColor: AppColors.creamColor,
        title: "Support Developer",
        onPressed: () {
          viewModel.goBack();
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const DeveloperProfileCard(),
                BuyMeACoffeeWidget(
                  sponsorID: "DevAdnani",
                ),
                VerticalSpaceBox.s16,
                const GratitudeHeader(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SupportDeveloperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SupportDeveloperViewModel();
}
