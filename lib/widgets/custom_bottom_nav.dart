import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:slt/l10n/app_localizations.dart';
import '../utils/responsive.dart';


class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),

      child: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),

        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primary,
          selectedItemColor: const Color.fromARGB(255, 0, 170, 255),
          unselectedItemColor: const Color.fromARGB(255, 236, 236, 236),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Responsive.setFontSize(12),
          ),
          unselectedLabelStyle: TextStyle(fontSize: Responsive.setFontSize(12)),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: AppLocalizations.of(context)!.navHome,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              label: AppLocalizations.of(context)!.navMessage,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month_rounded),
              label: AppLocalizations.of(context)!.navAppointment,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              label: AppLocalizations.of(context)!.navAccount,
            ),
            // Using a red icon specifically for emergency to make it pop!
            BottomNavigationBarItem(
              icon: const Icon(Icons.emergency),
              label: AppLocalizations.of(context)!.navEmergency,
            ),
          ],
        ),
      ),
    );
  }
}
