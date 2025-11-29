import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streakit/ui/common/app.assets.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

final socialLinks = [
  {
    'svgIcon': AppAssets.linkedin,
    'url': 'https://www.linkedin.com/in/dev-adnani/',
    'label': 'LinkedIn',
  },
  {
    'svgIcon': AppAssets.github,
    'url': 'https://github.com/Dev-Adnani',
    'label': 'GitHub',
  },
  {
    'svgIcon': AppAssets.website,
    'url': 'https://devadnani.com',
    'label': 'Website',
  },
  {
    'svgIcon': AppAssets.youtube,
    'url': 'https://www.youtube.com/@DevAadnani',
    'label': 'YouTube',
  },
  {
    'svgIcon': AppAssets.twitter,
    'url': 'https://x.com/AdnaniDev',
    'label': 'Twitter',
  },
];

class DeveloperProfileCard extends StatelessWidget {
  const DeveloperProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2A2A), Color(0xFF1A1A1A)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx8RqeSEqE7MXXBzdBbpw7_Ll76YQ6PIJS-A&s"),
          ),
          VerticalSpaceBox.s16,
          Text(
            'Dev Adnani',
            style: AppTextStyles.headlineLarge,
          ),
          VerticalSpaceBox.s2,
          Text(
            'Indie Developer',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          VerticalSpaceBox.s12,
          Text(
            'Bringing ideas to life , focused on building impactful and user-friendly solutions.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText3,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          VerticalSpaceBox.s12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var link in socialLinks) ...[
                SocialLinkButton(
                  svgIcon: link['svgIcon'] ?? AppAssets.info,
                  url: link['url'] ?? "",
                  label: link['label'] ?? "",
                ),
                HorizontalSpaceBox.s16,
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class SocialLinkButton extends StatelessWidget {
  final String svgIcon;
  final String url;
  final String label;

  const SocialLinkButton({
    super.key,
    required this.svgIcon,
    required this.url,
    required this.label,
  });

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _launchUrl,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              svgIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
