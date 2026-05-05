import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/image_carousel.dart';
import '../widgets/service_card.dart';

class ConsularServices extends StatefulWidget {
  const ConsularServices({super.key});

  @override
  State<ConsularServices> createState() => _ConsularServicesState();
}

class _ConsularServicesState extends State<ConsularServices> {
  final double carouselHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.consularServices,
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.setWidth(20),
                      vertical: Responsive.setHeight(10),
                    ),
                    child: ImageCarousel(
                      imagePaths: const [
                        'assets/images/passport1.jpg',
                        'assets/images/passport3.png',
                        'assets/images/passport2.jpg',
                      ],
                      height: carouselHeight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.setWidth(20),
                      vertical: Responsive.setHeight(1),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.availableServices,
                        style: AppTextStyles.sectionHeader,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.setWidth(20)),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ServiceCard(
                            title: AppLocalizations.of(context)!.appointments,
                            icon: Icons.event_available_outlined,
                            onTap: () {

                            },
                          ),
                          SizedBox(width: Responsive.setWidth(12)),
                          ServiceCard(
                            title: AppLocalizations.of(context)!.passportServices,
                            icon: Icons.badge_outlined,
                            onTap: () {


                            },
                          ),
                          SizedBox(width: Responsive.setWidth(12)),
                          ServiceCard(
                            title: AppLocalizations.of(context)!.birthRegistration,
                            icon: Icons.face_outlined,
                            onTap: () {

                            },
                          ),
                          SizedBox(width: Responsive.setWidth(12)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.setHeight(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.setWidth(20)),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ServiceCard(
                            title: "Marriage Registration", 
                            icon: Icons.favorite_outline,
                             onTap: () {

                             }),
                          SizedBox(width: Responsive.setWidth(12)),
                          ServiceCard(
                            title: "Death Registration",
                             icon: Icons.sentiment_very_dissatisfied_outlined,
                              onTap: () {

                              }),
                          SizedBox(width: Responsive.setWidth(12)),
                          ServiceCard(
                            title: "Document Attestation",
                           icon: Icons.document_scanner_outlined, 
                           onTap: () {

                           }),
                          SizedBox(width: Responsive.setWidth(12)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.setHeight(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.setWidth(20)),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ServiceCard(
                            title: "Visa Services", 
                            icon: Icons.airplane_ticket_outlined,
                             onTap: () {}),
                          SizedBox(width: Responsive.setWidth(12)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.setHeight(36)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
