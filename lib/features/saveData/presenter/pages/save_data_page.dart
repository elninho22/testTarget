import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/core/loading/loading_default.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testarget/core/ui/extensions/size_screen_extension.dart';
import 'package:testarget/core/ui/text_styles.dart';
import '../../../../core/factory_inputs/form_field_login.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/ui/const_colors.dart';
import '../../infra/parameters/parameters_save_data.dart';
import '../store/save_data_store.dart';

class SaveDataPage extends StatefulWidget {
  const SaveDataPage({Key? key}) : super(key: key);

  @override
  State<SaveDataPage> createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final _controller = Modular.get<SaveDataStore>();
  late AnimationController _controllerBuilder;

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _focusText = FocusNode();

  @override
  void initState() {
    super.initState();
    // _controller.initLoading();
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
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.greenAccent,
                        Colors.green,
                        Colors.green.shade200,
                        Colors.green.shade300,
                      ],
                    ),
                  ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 400.h,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            20.0, 6.0, 20.0, 0.0),
                                        child: ListTile(
                                          title: Text(
                                            'teztoooo',
                                            style: FactoryTextStyles.bodySmall()
                                                .copyWith(fontSize: 20.h),
                                            textAlign: TextAlign.center,
                                          ),
                                          trailing: SizedBox(
                                            width: 100.w,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.edit,
                                                  ),
                                                  color: ConstColors.blackFull,
                                                  iconSize: 30.h,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.delete,
                                                  ),
                                                  color: ConstColors.red300,
                                                  iconSize: 30.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    sizedBoxDefault,
                                    sizedBoxDefault,
                                    CustomTextFormField(
                                      labelText: 'Digite seu texto',
                                      maxLines: 2,
                                      minLines: 1,
                                      controller: _textController,
                                      focusNode: _focusText,
                                      autofocus: true,
                                      onEditingComplete: () => onPressed(),
                                      onFieldSubmitted: (data) => Helpers.focus(
                                          context, _focusText, _focusText),
                                      validators: FactoryValidators.multiple([
                                        FactoryValidators.min(2,
                                            m: 'Mínimo 2 Caracteres'),
                                        FactoryValidators.required(
                                            m: 'Campo obrigatório'),
                                        FactoryValidators.validPassword(
                                            m: 'Não pode conter caracteres especiais'),
                                      ]),
                                    ),
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
          ),
        );
      },
    );
  }

  onPressed() async {
    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      Helpers.unfocusForm(context);
      _formKey.currentState?.save();
      int createdAt = DateTime.now().millisecondsSinceEpoch;
      ParametersSaveData parameters = ParametersSaveData(
        text: _textController.text.toString(),
        createdAt: createdAt,
      );
      await _controller.saveDataUser(parameters: parameters);
    }
  }
}
