import 'package:flutter/material.dart';
import 'package:slt/utils/app_colors.dart';
import 'package:slt/utils/responsive.dart';
import 'package:slt/widgets/custom_button.dart';
import 'package:slt/widgets/custom_text_field.dart';


import 'package:slt/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:country_picker/country_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _nicController;
  late final TextEditingController _passportController;
  late final TextEditingController _mobileController;
  late final TextEditingController _emailController;

  late final TextEditingController _countryController;

  bool _isEditing = false;
  @override
  void initState() {
    super.initState();

    final draft = context.read<SignUpProvider>();

    _firstNameController = TextEditingController(text: draft.draftFirstName);
    _lastNameController = TextEditingController(text: draft.draftLastName);
    _nicController = TextEditingController(text: draft.draftNic);
    _passportController = TextEditingController(text: draft.draftPassport);
    _mobileController = TextEditingController(text: draft.draftMobile);
    _emailController = TextEditingController(text: draft.draftEmail);
    _countryController = TextEditingController(text: draft.draftCountry);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nicController.dispose();
    _passportController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    final double horizontalPadding = Responsive.setWidth(19);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: () => setState(() => _isEditing = !_isEditing),
          ),
        ],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: Responsive.setHeight(20),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor:  const Color.fromARGB(168, 250, 231, 19),
                child: Icon(Icons.person, size: 70, color: AppColors.primary,),
              ),
              SizedBox(height: Responsive.setHeight(24)),
              CustomTextField(
                controller: _firstNameController,
                hint: "First Name",
                icon: Icons.person,
                readOnly: !_isEditing,
              ),
              SizedBox(height: Responsive.setHeight(8)),
              CustomTextField(
                controller: _lastNameController,
                hint: "Last Name",
                icon: Icons.person_outline,
                readOnly: !_isEditing,
              ),
              SizedBox(height: Responsive.setHeight(8)),
              CustomTextField(
                controller: _nicController,
                hint: "NIC Number",
                icon: Icons.badge,
                readOnly: !_isEditing,
              ),
              SizedBox(height: Responsive.setHeight(8)),
              CustomTextField(
                controller: _mobileController,
                hint: "Mobile Number",
                icon: Icons.phone,
                readOnly: !_isEditing,
              ),
              SizedBox(height: Responsive.setHeight(8)),
              CustomTextField(
                controller: _emailController,
                hint: "Email Address",
                icon: Icons.email,
                readOnly: true, // Usually emails aren't changeable easily
              ),
              SizedBox(height: Responsive.setHeight(8)),

              CustomTextField(
                controller: _countryController,
                hint: "Work Country",
                icon: Icons.public,
                readOnly: true,
                onTap: _isEditing ? () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      setState(() => _countryController.text = country.name);
                    },
                  );
                } : null,
              ),
              SizedBox(height: Responsive.setHeight(24)),
              if (_isEditing)
                Consumer<SignUpProvider>(
                  builder: (context, provider, child) {
                    return CustomButton(
                      text: "Save Changes",
                      isLoading: provider.isLoading,
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                              final success = await context
                                  .read<SignUpProvider>()
                                  .signUpUser(
                                    firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    mobile: _mobileController.text.trim(),
                                    nic: _nicController.text.trim(),
                                    passport: _passportController.text.trim(),
                                    password: 'unchanged',
                                    confirmPassword: 'unchanged',
                                    country: _countryController.text.trim(),
                                  );

                              if (!context.mounted) return;

                              if (success) {
                                setState(() => _isEditing = false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Profile Updated!"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(provider.error ?? "Failed to save changes."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                    );
                  },
                ),
              SizedBox(height: Responsive.setHeight(24)),
            ],
          ),
        ),
      ),
    );
  }
}
