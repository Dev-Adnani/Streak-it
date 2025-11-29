import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'friends_viewmodel.dart';

class FriendsView extends StackedView<FriendsViewModel> {
  const FriendsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FriendsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  FriendsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FriendsViewModel();
}
