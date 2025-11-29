import 'package:flutter/cupertino.dart';
import 'package:streakit/ui/common/app.colors.dart';

class SettingsSection extends StatelessWidget {
  final String name;
  final List<Widget> children;
  const SettingsSection({
    super.key,
    required this.name,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 10, bottom: 8),
            child: Text(
              name,
              style: const TextStyle(
                color: AppColors.creamColor,
              ),
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
