// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

/// URL to the Buy Me a Coffee website
const String buyMeACoffeeBaseUrl = "https://www.buymeacoffee.com/";

class BuyMeACoffeeWidget extends StatelessWidget {
  const BuyMeACoffeeWidget({
    super.key,
    required this.sponsorID,
    this.customText = "Buy me a coffee",
    this.textStyle,
    this.backgroundColor = const Color(0xFFFF813F),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    this.iconSize = 35.0,
  });

  /// Sponsor ID to create the full URL
  final String sponsorID;

  /// Custom text displayed next to the icon
  final String customText;

  /// Style for the custom text
  final TextStyle? textStyle;

  /// Background color of the button
  final Color backgroundColor;

  /// Padding inside the button
  final EdgeInsets padding;

  /// Size of the icon
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final url = Uri.parse("$buyMeACoffeeBaseUrl$sponsorID");
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch URL')),
          );
        }
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              "https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg",
              width: iconSize,
              height: iconSize,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                customText,
                style: textStyle ??
                    GoogleFonts.cookie(
                      fontSize: 24.0,
                      color: Colors.white,
                      letterSpacing: 0.6,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
