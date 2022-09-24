import 'package:flutter/material.dart';
import 'package:learn_flu_dynamic_form_b02/models/user_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // UserModel userModel = UserModel(
  //   userName: '',
  //   userAge: 0,
  //   emails: new List<String>.empty(growable: true),
  // );

  UserModel userModel = UserModel(
    userName: '',
    userAge: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel.emails = List<String>.empty(growable: true);
    userModel.emails!.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Form"),
        backgroundColor: Colors.redAccent,
      ),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return new Form(
      key: globalKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "userName",
                "User Name",
                "",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'User Name can\'t be empty.';
                  }

                  return null;
                },
                (onSavedVal) => {
                  userModel.userName = onSavedVal,
                },
                initialValue: this.userModel.userName,
                obscureText: false,
                borderFocusColor: Theme.of(context).primaryColor,
                prefixIconColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                borderRadius: 2,
                paddingLeft: 0,
                paddingRight: 0,
                fontSize: 13,
                labelFontSize: 13,
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.web),
                onChange: (val) {},
              ),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "userAge",
                "Age",
                "",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Age can\'t be empty.';
                  }

                  return null;
                },
                (onSavedVal) => {
                  userModel.userAge = int.parse(onSavedVal),
                },
                initialValue: this.userModel.userAge.toString(),
                obscureText: false,
                borderFocusColor: Theme.of(context).primaryColor,
                prefixIconColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                borderRadius: 2,
                paddingLeft: 0,
                paddingRight: 0,
                fontSize: 13,
                labelFontSize: 13,
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.web),
                onChange: (val) {},
              ),
              _emailsContainer(),
              Center(
                child: FormHelper.submitButton("Save", (){
                  if(validateAndSave()) {
                    print(userModel.toJson());
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Email Address(s)',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  emailUi(index),
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: userModel.emails!.length,
        )
      ],
    );
  }

  Widget emailUi(index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: FormHelper.inputFieldWidgetWithLabel(
              context,
              "email_$index",
              "",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Email ${index + 1} can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                userModel.emails![index] = onSavedVal,
              },
              initialValue: this.userModel.userName,
              obscureText: false,
              borderFocusColor: Theme.of(context).primaryColor,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 2,
              paddingLeft: 0,
              paddingRight: 0,
              fontSize: 13,
              showPrefixIcon: true,
              prefixIcon: Icon(Icons.email),
              onChange: (val) {},
            ),
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                onPressed: () {
                  addEmailControl();
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
              ),
            ),
            visible: index == userModel.emails!.length - 1,
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                onPressed: () {
                  removeEmailControl(index);
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                ),
              ),
            ),
            visible: index > 0,
          ),
        ],
      ),
    );
  }

  void addEmailControl() {
    setState(() {
      userModel.emails!.add("");
    });
  }

  void removeEmailControl(index) {
    setState(() {
      if(userModel.emails!.length > 1) {
        userModel.emails!.removeAt(index);
      }
    });
  }

  bool validateAndSave(){
    final form =globalKey.currentState;
    if(form!.validate()) {
      form.save();
      form.reset();
      return true;
    }else {
      return false;
    }
  }
}
