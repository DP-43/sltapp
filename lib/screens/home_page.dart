import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/feature_button.dart';

import '../widgets/image_carousel.dart';
import '../widgets/custom_dropdown.dart';
import 'complaint_portal_page.dart';
import 'embassy_services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  // The local asset paths for the requested images
  final List<String> _imagePaths = [
    'assets/images/maligawa.jpg',
    'assets/images/nelumkuluna.jpg',
    'assets/images/gallefort.jpg',
    'assets/images/temple.jpg',
  
  ];
  

  bool _showEmbassyDropdown = false;
  String? _selectedEmbassy;
  List<String> _embassies = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _embassies = [
      AppLocalizations.of(context)!.abuDhabiEmbassy,
    ];
    _selectedEmbassy ??= AppLocalizations.of(context)!.abuDhabiEmbassy;
  }

  @override
  Widget build(BuildContext context) {
   
    

    final double carouselHeight = 200.0;
   

    return Scaffold(
      backgroundColor: AppColors.background,
      
      

   
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.navHome, style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: ImageCarousel(
                  imagePaths: _imagePaths,
                  height: carouselHeight,
                ),
              ),
            
              Padding(
                padding: EdgeInsets.only(
                  left: Responsive.setWidth(20),
                  right: Responsive.setWidth(20),
                  top: Responsive.setHeight(20),
                  bottom: Responsive.setHeight(8), 
                ),
                child: Column(
                  children: [
                    FeatureButton(
                      title: AppLocalizations.of(context)!.complaintPortalTitle,
                      icon: Icons.report_problem_outlined,
                      color: AppColors.primary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ComplaintPortalPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10), 
                    FeatureButton(
                      title: AppLocalizations.of(context)!.embassyServices,
                      icon: Icons.account_balance_outlined,
                      color: AppColors.primary,
                      onPressed: () {
                        setState(() {
                          _showEmbassyDropdown = !_showEmbassyDropdown;
                        });
                      },
                    ),
                    if (_showEmbassyDropdown) ...[
                      const SizedBox(height: 10),
                      CustomDropdown<String>(
                        hint: AppLocalizations.of(context)!.selectEmbassy,
                        icon: Icons.location_on_outlined,
                        items: _embassies,
                        value: _selectedEmbassy,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedEmbassy = value;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmbassyServices(selectedEmbassy: value),
                              ),
                            );
                          }
                        },
                        itemLabelBuilder: (item) => item,
                      ),
                    
                    ],
                  ],
                ),
              ),
  
             
  
            ],
          ),
        ),
      ),
    );
  }
}
