import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../product/constant/image_enum.dart';
import '../../../product/padding/page_padding.dart';
import '../../../product/utility/input_decorations.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String name = "name";
  final String login = "Login";
  final String data = "Remember me";
  final String text = "Login";

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _loginViewModel,
        builder: (context, child) {
          return bodyView(context);
        });
  }

  Scaffold bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _loadingWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PagePadding.allLow(),
          child: Column(
            children: [
              AnimatedContainer(
                duration: context.durationLow,
                width: context.dynamicHeight(0.2),
                height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.4),
                child: ImageEnums.door.ToImage,
              ),
              Text(
                text,
                style: context.textTheme.headline3,
              ),
              TextField(
                decoration: ProjectInputs(name),
              ),
              ElevatedButton(
                  onPressed: context.watch<LoginViewModel>().isLoading
                      ? null
                      : () {
                          context.read<LoginViewModel>().controlTextValue();
                        },
                  child: Center(child: Text(login))),
              CheckboxListTile(
                  value: context.watch<LoginViewModel>().isCheckBoxOkey,
                  title: Text(data),
                  onChanged: (value) {
                    context
                        .read<LoginViewModel>()
                        .checkBoxChange(value ?? false);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Selector<LoginViewModel, bool>(
      selector: (context, viewModel) {
        return viewModel.isLoading;
      },
      builder: (context, value, child) {
        return value
            ? const Center(child: CircularProgressIndicator())
            : SizedBox();
      },
    );
    return Consumer<LoginViewModel>(
      builder: (context, value, child) {
        return value.isLoading
            ? Center(child: CircularProgressIndicator())
            : SizedBox();
      },
    );
  }
}
