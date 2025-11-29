import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'html_viewmodel.dart';

class HtmlView extends StackedView<HtmlViewModel> {
  final HtmlScreenParams params;

  const HtmlView({required this.params, super.key});

  @override
  Widget builder(
    BuildContext context,
    HtmlViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: params.title,
        iconData: params.iconData,
        iconColor: params.iconColor,
        onPressed: () {
          viewModel.popScreen();
        },
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Html(
            data: params.policyLink,
          ),
        ),
      ),
    );
  }

  @override
  HtmlViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HtmlViewModel();
}

class HtmlScreenParams {
  final String policyLink;
  final String title;
  final IconData iconData;
  final Color iconColor;

  HtmlScreenParams({
    required this.policyLink,
    required this.title,
    required this.iconData,
    required this.iconColor,
  });
}
