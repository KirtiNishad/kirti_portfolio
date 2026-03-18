import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      width: double.infinity,
      color: AppColors.background,
      child: Responsive(
        mobile: Column(
          children: [
            _ProfileImage(),
            const SizedBox(height: 30),
            _HeroText(),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _ProfileImage()),
            const SizedBox(width: 50),
            Expanded(child: _HeroText()),
          ],
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
        image: const DecorationImage(
          image: AssetImage("assets/profile_image.jpeg"), // Placeholder
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, my name is",
          style: GoogleFonts.firaCode(
            color: AppColors.primary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppStrings.name,
          style: GoogleFonts.inter(
            color: AppColors.textPrimary,
            fontSize: Responsive.isMobile(context) ? 40 : 80,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        Text(
          AppStrings.role,
          style: GoogleFonts.inter(
            color: AppColors.textSecondary,
            fontSize: Responsive.isMobile(context) ? 30 : 60,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        /*const SizedBox(height: 30),
        SizedBox(
          width: Responsive.isMobile(context) ? double.infinity : 500,
          child: Text(
            AppStrings.aboutMe,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ),*/
        const SizedBox(height: 50),
        OutlinedButton(
          onPressed: () async {
            if (!await launchUrl(Uri.parse("https://github.com/KirtiNishad"))) {
            throw Exception('Could not launch');
            }
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary),
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: const Text(
            "Check out my work!",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
