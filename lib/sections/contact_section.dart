import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirti_portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.background,
      child: Column(
        children: [
          _SectionTitle(number: "05.", title: "What's Next?",),
          const SizedBox(height: 20),
          Text(
            "Get In Touch",
            style: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Address Info
          _AddressItem(icon: Icons.location_on, text: "Current: ${AppStrings.currentAddress}"),
          const SizedBox(height: 10),
          _AddressItem(icon: Icons.home, text: "Permanent: ${AppStrings.permanentAddress}"),
          const SizedBox(height: 40),
          _SocialButton(
            icon: Icons.email,
            label: "Email",
            onPressed: () => launchUrl(Uri(scheme: 'mailto', path: AppStrings.contactEmail)),
          ),
        ],
      ),
    );
  }
}

class _AddressItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _AddressItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary),
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      icon: FaIcon(icon, size: 20),
      label: Text(label, style: const TextStyle(fontSize: 16)),
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