import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.secondaryBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(number: "01.", title: "About Me"),
          const SizedBox(height: 40),
          Responsive(
            mobile: Column(
              children: [
                _AboutText(),
                const SizedBox(height: 40),
                _SkillsList(),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _AboutText()),
                const SizedBox(width: 50),
                Expanded(flex: 2, child: _SkillsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String number;
  final String title;

  const _SectionTitle({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: GoogleFonts.firaCode(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.inter(
            color: AppColors.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(child: Container(height: 1, color: AppColors.textSecondary.withOpacity(0.3))),
      ],
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.aboutMe, // Using placeholder for now
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 18,
        height: 1.6,
      ),
    );
  }
}

class _SkillsList extends StatelessWidget {
  final List<String> skills = const [
    "Flutter",
    "Dart",
    "Firebase",
    "Rest API",
    "Git",
    "UI/UX Design",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Here are a few technologies I've been working with recently:",
          style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: skills.map((skill) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_right, color: AppColors.primary, size: 16),
              const SizedBox(width: 5),
              Text(skill, style: GoogleFonts.firaCode(color: AppColors.textSecondary, fontSize: 14)),
            ],
          )).toList(),
        ),
      ],
    );
  }
}
