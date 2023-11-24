import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/core/loading/loading_default.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testarget/core/ui/extensions/size_screen_extension.dart';
import 'package:testarget/core/ui/text_styles.dart';
import '../../../../core/factory_inputs/form_field_login.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/ui/button_default.dart';
import '../../infra/parameters/parameters_user.dart';
import '../store/user_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final _controller = Modular.get<UserStore>();
  late AnimationController _controllerBuilder;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _focusMail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isObscurePassword = true;

  @override
  void initState() {
    super.initState();
    _controller.initLoading();
    _controllerBuilder = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _controllerBuilder.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget get sizedBoxDefault => const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return LoadingDefault(
          isLoading: _controller.isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light, //Android
                statusBarBrightness: Brightness.light, //IOS
              ),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.white,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 35),
                                    CustomTextFormField(
                                      onChanged: (v) => setState(() => ()),
                                      focusNode: _focusMail,
                                      formFieldType: TextInputType.emailAddress,
                                      labelText: 'E-mail',
                                      maxLength: 20,
                                      onFieldSubmitted: (data) => Helpers.focus(
                                          context, _focusMail, _focusPassword),
                                      controller: _emailController,
                                      validators: FactoryValidators.multiple([
                                        FactoryValidators.required(
                                            m: 'E-mail obrigatório'),
                                        FactoryValidators.email(
                                            m: 'E-mail ínvalido'),
                                        FactoryValidators.max(20, m: 'Máx'),
                                      ]),
                                    ),
                                    sizedBoxDefault,
                                    CustomTextFormField(
                                      onChanged: (v) => setState(() => ()),
                                      focusNode: _focusPassword,
                                      labelText: 'Senha',
                                      maxLength: 20,
                                      controller: _passwordController,
                                      toggleObscureText: _toggleObscureText,
                                      obscureText: _isObscurePassword,
                                      validators: FactoryValidators.multiple([
                                        FactoryValidators.min(2,
                                            m: 'Mínimo 2 Caracteres'),
                                        FactoryValidators.required(
                                            m: 'Senha obrigatório'),
                                        FactoryValidators.max(20,
                                            m: 'Máximo de Caracteres'),
                                        FactoryValidators.validPassword(
                                            m: 'Não pode conter caracteres especiais'),
                                      ]),
                                    ),
                                    sizedBoxDefault,
                                    ButtonDefault(
                                      label: 'Entrar',
                                      onPressed: () => onPressed(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ),
            bottomNavigationBar: SizedBox(
              height: 100.h,
              child: TextButton(
                onPressed: () async {
                  await _controller.launchInBrowser(
                    'https://www.google.com.br',
                  );
                },
                child: Text(
                  'Política de Privacidade',
                  style: FactoryTextStyles.bodySmall(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleObscureText() {
    setState(() {
      _isObscurePassword = !_isObscurePassword;
    });
  }

  onPressed() async {
    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      Helpers.unfocusForm(context);
      _formKey.currentState?.save();
      ParametersUser parameters = ParametersUser(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text.toString().trim(),
      );
      await _controller.loginUser(parameters: parameters);
    }
  }
}
