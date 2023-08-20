import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_text.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/user1.png',
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Phucdn",
                style: AppText.subtitle3,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset('assets/temp/post1.jpg'),
          SizedBox(
            height: 12,
          ),
          Text(
            "Test title-b01",
            style: AppText.subtitle3,
          ),
        ],
      ),
    );
  }
}
