import 'package:flutter/material.dart';
import 'package:kirti_portfolio/sections/about_section.dart';
import 'package:kirti_portfolio/sections/contact_section.dart';
import 'package:kirti_portfolio/sections/experience_section.dart';
import 'package:kirti_portfolio/sections/hero_section.dart';
import 'package:kirti_portfolio/sections/projects_section.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:kirti_portfolio/widgets/footer.dart';
import 'package:kirti_portfolio/widgets/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void _onResumeClick(){
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavBar(
          onMenuClick: () => _scaffoldKey.currentState?.openDrawer(),
          onAboutClick: () => _scrollToSection(_aboutKey),
          onExperienceClick: () => _scrollToSection(_experienceKey),
          onProjectsClick: () => _scrollToSection(_projectsKey),
          onContactClick: () => _scrollToSection(_contactKey),
          onResumeClick: () => _onResumeClick(),
        ),
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: AppColors.secondaryBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.background),
              child: Center(
                child: Text(
                  "<Kirti />",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("About", style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_aboutKey);
              },
            ),
            ListTile(
              title: const Text("Experience", style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_experienceKey);
              },
            ),
            ListTile(
              title: const Text("Projects", style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_projectsKey);
              },
            ),
            ListTile(
              title: const Text("Contact", style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              },
            ),
            // SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: OutlinedButton(
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
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _heroKey),
            AboutSection(key: _aboutKey),
            ExperienceSection(key: _experienceKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
