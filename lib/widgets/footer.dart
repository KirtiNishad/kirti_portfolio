import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(icon: FontAwesomeIcons.github, url: "https://github.com/KirtiNishad"),
              const SizedBox(width: 20),
              _SocialIcon(icon: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com/in/kirti-nishad-833a58219/"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Designed & Built by ${AppStrings.name}",
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch $url');
        }
      },
      icon: FaIcon(icon, color: AppColors.textPrimary, size: 20),
      hoverColor: AppColors.primary.withOpacity(0.1),
    );
  }
}
