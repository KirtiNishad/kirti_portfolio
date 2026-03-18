import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(number: "02.", title: "Experience"),
          const SizedBox(height: 40),
          // Placeholder Experience List
          _ExperienceItem(
            role: "Flutter Developer",
            company: "RV Solutions Pvt. Ltd.",
            duration: "June 2023 - Present",
            description: "Developed and maintained mobile applications using Flutter. Collaborated with cross-functional teams to define, design, and ship new features.",
          ),
          const SizedBox(height: 30),
          _ExperienceItem(
            role: "Flutter Intern",
            company: "Ricoz",
            duration: "January 2024 - May 2024",
            description: "Assisted in the development of applications. Wrote clean, maintainable, and efficient code.",
          ),
          const SizedBox(height: 50),
          _SectionTitle(number: "03.", title: "Education"),
          const SizedBox(height: 40),
           _ExperienceItem(
            role: "B.Tech in Computer Science",
            company: "Dr. APJ Abdul Kalam Technical University, Lucknow",
            duration: "2019 - 2023",
            description: "Graduated with Honors. Focused on Software Engineering and Mobile Development.",
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

class _ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String description;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  role,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!Responsive.isMobile(context))
                Text(
                  duration,
                  style: GoogleFonts.firaCode(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            company,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),
          if (Responsive.isMobile(context)) ...[
            const SizedBox(height: 10),
             Text(
                  duration,
                  style: GoogleFonts.firaCode(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
          ],
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
