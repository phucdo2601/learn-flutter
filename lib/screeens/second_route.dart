import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Second Screen"
        ),

      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "Welcome to Second Screen!"
              ),

              const SizedBox(
                height: 30,
              ),

              ElevatedButton(
                onPressed: (){
                  /**
                   * pop la dong tranghien tai , quay tro lai trang truoc do
                   * tuc co nghia la  dong lun screen do, screen do khong con ton tai trong vong doi cua ung dung
                   */
                  Navigator.pop(context);
                },
                child: const Text(
                    "Back to first Screen"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
