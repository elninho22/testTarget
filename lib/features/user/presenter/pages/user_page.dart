import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/core/loading/loading_default.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testarget/core/ui/text_styles.dart';
import '../../../../core/factory_inputs/form_field_login.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/ui/button_default.dart';
import '../../../../core/ui/const_colors.dart';
import '../../infra/parameters/parameters_user.dart';
import '../store/user_store.dart';
import '../widgets/customNavigatorBar.dart';
import '../widgets/helper_label_info.dart';

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
    LinearGradient gradient = const LinearGradient(
      colors: [
        ConstColors.greenGradientOne,
        ConstColors.greenGradientTwo,
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.1, 0.9],
      tileMode: TileMode.clamp,
    );

    return Observer(
      builder: (context) {
        return LoadingDefault(
          isLoading: _controller.isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    gradient: gradient,
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 35),
                          const WidgetHelperLabelInfo(titile: 'Usúario'),
                          sizedBoxDefault,
                          CustomTextFormField(
                            fillColor: ConstColors.white,
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
                              FactoryValidators.email(m: 'E-mail ínvalido'),
                              FactoryValidators.max(20, m: 'Máx'),
                            ]),
                          ),
                          sizedBoxDefault,
                          const WidgetHelperLabelInfo(titile: 'Senha'),
                          sizedBoxDefault,
                          CustomTextFormField(
                            fillColor: ConstColors.white,
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
                            labelStyle: FactoryTextStyles.bodySmall(
                              color: ConstColors.white,
                            ).copyWith(
                              fontSize: 22,
                            ),
                            label: 'Entrar',
                            onPressed: () => onPressed(),
                          ),
                        ],
                      )),
                );
              },
            ),
            bottomNavigationBar: CustomBottomNavigatorBar(controller: _controller),
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
