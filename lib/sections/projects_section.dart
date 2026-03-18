import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/utils/responsive.dart';
import 'package:kirti_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.secondaryBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(number: "04.", title: "Things I've Built"),
          // const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = Responsive.isDesktop(context)
                  ? 3
                  : Responsive.isTablet(context)
                      ? 2
                      : 1;
              double aspectRatio = Responsive.isMobile(context) ? 1.0 : 1.1;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: aspectRatio,
                children: const [
                  ProjectCard(
                    title: "ICCC 2027",
                    description: '''ICCC 2027 is the official app for the International Congress on the Chemistry of Cement, providing event information, schedules, and updates for the global cement chemistry conference organized by the National Council for Cement and Building Materials.''',
                    techStack: ["Dart", "Flutter", "Firebase", "Cubit"],
                    liveUrl: "https://play.google.com/store/apps/details?id=com.app.ncbindia&hl=en_IN",
                  ),
                  ProjectCard(
                    title: "Mausam",
                    description: '''Mausam is the official IMD weather app providing real-time weather updates, forecasts, and alerts through a simple and user-friendly interface.''',
                    techStack: ["Dart", "Flutter", "Geoserver", "Leaflet", "WebView", "Bloc"],
                    liveUrl: "https://play.google.com/store/apps/details?id=com.imd.masuam&hl=en_IN",
                  ),
                  ProjectCard(
                    title: "Offline Survey App",
                    description: '''Developed an offline-first survey management app using Flutter and LimeSurvey, featuring dynamic surveys, local data storage, and background data sync when online.''',
                    techStack: ["Dart", "Flutter", "LimeSurvey", "SqfLite", "Work Manager", "php"],
                  ),
                  ProjectCard(
                    title: "Mera Ration",
                    description: '''Mera Ration is a multi-role application for Beneficiary, State, and Central users. It enables different features like ration tracking, ration card surrender/transfer, grievance, FPS discovery, receipts and family management. Administrative users access dashboards for beneficiary monitoring, ration distribution, DBT, grievance handling, FPS ranking, and communication.''',
                    techStack: ["Dart", "Flutter"],
                    liveUrl: "https://play.google.com/store/search?q=mera+ration&c=apps&hl=en",
                  ),
                ],
              );
            },
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
