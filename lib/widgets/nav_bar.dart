import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onMenuClick;
  final VoidCallback onAboutClick;
  final VoidCallback onExperienceClick;
  final VoidCallback onProjectsClick;
  final VoidCallback onContactClick;
  final VoidCallback onResumeClick;

  const NavBar({
    super.key,
    required this.onMenuClick,
    required this.onAboutClick,
    required this.onExperienceClick,
    required this.onProjectsClick,
    required this.onContactClick,
    required this.onResumeClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: AppColors.background.withOpacity(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "<Kirti />",
                  style: GoogleFonts.firaCode(
                    color: AppColors.primary,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Row(
                    children: [
                      _NavItem(title: "About", onTap: onAboutClick),
                      _NavItem(title: "Experience", onTap: onExperienceClick),
                      _NavItem(title: "Projects", onTap: onProjectsClick),
                      _NavItem(title: "Contact", onTap: onContactClick),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () async {
                          if (!await launchUrl(
                            Uri.parse(
                              "https://drive.google.com/file/d/1YKFYYpDAmPmhNj0Je2r14rpK4s1vDPO1/view?usp=sharing",
                            ),
                          )) {}
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primary),
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                        child: const Text("Resume"),
                      ),
                    ],
                  )
                else
                  IconButton(
                    onPressed: onMenuClick,
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
        ),
      ),
    );
  }
}
