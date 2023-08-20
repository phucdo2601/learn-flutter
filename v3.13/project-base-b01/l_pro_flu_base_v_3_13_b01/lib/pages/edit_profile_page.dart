import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/app_text_field.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/toolbar.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/user_avatar.dart';
import 'package:l_pro_flu_base_v_3_13_b01/config/app_strings.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_colors.dart';

enum GenderChoice { none, male, female, other }

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = GenderChoice.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.editProfile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: UserAvatar(
                      size: 120,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              AppTextField(hint: AppStrings.firstName),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.lastName),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.phoneNumber),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.location),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.birthday),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.fieldColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.gender),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Text(AppStrings.male),
                              value: GenderChoice.male,
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = GenderChoice.male;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              title: Text(AppStrings.female),
                              value: GenderChoice.female,
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = GenderChoice.female;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              title: Text(AppStrings.other),
                              value: GenderChoice.other,
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = GenderChoice.other;
                                });
                              }),
                        ),
                      ],
                    ),
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
