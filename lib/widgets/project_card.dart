import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // transform: isHovered ? (Matrix4.identity()..translate(0, -10, 0)) : Matrix4.identity(),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.background,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.githubUrl != null)
                  IconButton(
                    onPressed: () => launchUrl(Uri.parse(widget.githubUrl!)),
                    icon: const FaIcon(FontAwesomeIcons.appStore, color: AppColors.textPrimary, size: 20),
                  ),
                if (widget.liveUrl != null)
                  IconButton(
                    onPressed: () => launchUrl(Uri.parse(widget.liveUrl!)),
                    icon: const FaIcon(FontAwesomeIcons.externalLinkAlt, color: AppColors.textPrimary, size: 20),
                  ),
              ],
            ),
            Expanded(
              child: Text(
                widget.description,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: widget.techStack
                  .map((tech) => Text(
                        tech,
                        style: GoogleFonts.firaCode(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
