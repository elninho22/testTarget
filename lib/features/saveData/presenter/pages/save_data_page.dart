import 'package:flutter/material.dart';
import 'package:testarget/core/loading/loading_default.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testarget/core/ui/extensions/size_screen_extension.dart';
import 'package:testarget/core/ui/text_styles.dart';
import '../../../../core/factory_inputs/form_field_login.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/ui/const_colors.dart';
import '../../infra/parameters/register_entity.dart';
import '../controllers/save_data_store.dart';

class SaveDataPage extends StatefulWidget {
  final SaveDataStore controller;
  const SaveDataPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SaveDataPage> createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  SaveDataStore get _controller => widget.controller;
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _focusText = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.allRegisters();
      _controller.isEdit = false;
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusText.dispose();
    super.dispose();
  }

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
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: gradient,
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
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            20.0, 6.0, 20.0, 0.0),
                                        child: Observer(
                                          builder: (_) {
                                            if (_controller
                                                .listRegisters.isEmpty) {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Nenhum dado encontrado',
                                                      style: FactoryTextStyles
                                                              .bodySmall()
                                                          .copyWith(
                                                              fontSize: 18.h),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    TextButton(
                                                      onPressed: () =>
                                                          _controller
                                                              .allRegisters(),
                                                      child: Text(
                                                        'Atualizar',
                                                        style: FactoryTextStyles
                                                                .bodySmall()
                                                            .copyWith(
                                                                fontSize: 15.h),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              controller: _scrollController,
                                              shrinkWrap: true,
                                              reverse: true,
                                              itemCount: _controller
                                                  .listRegisters.length,
                                              itemBuilder: (_, index) {
                                                RegisterEntity data =
                                                    _controller
                                                        .listRegisters[index];
                                                return ListTile(
                                                  title: Text(
                                                    data.content ?? '',
                                                    style: FactoryTextStyles
                                                            .bodySmall()
                                                        .copyWith(
                                                            fontSize: 20.h),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  trailing: SizedBox(
                                                    width: 100.w,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            _textController
                                                                    .text =
                                                                data.content ??
                                                                    '';
                                                            _controller
                                                                .setIndex(
                                                                    index);
                                                          },
                                                          icon: const Icon(
                                                            Icons.edit,
                                                          ),
                                                          color: ConstColors
                                                              .blackFull,
                                                          iconSize: 30.h,
                                                        ),
                                                        IconButton(
                                                          onPressed: () =>
                                                              _controller
                                                                  .removeItem(
                                                                      index),
                                                          icon: const Icon(
                                                            Icons.delete,
                                                          ),
                                                          color: ConstColors
                                                              .red300,
                                                          iconSize: 30.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    CustomTextFormField(
                                          fillColor: ConstColors.white,
                                          labelText: 'Digite seu texto',
                                          maxLines: 2,
                                          minLines: 1,
                                          controller: _textController,
                                          focusNode: _focusText,
                                          autofocus: true,
                                          onEditingComplete: () => onPressed(isEdit: _controller.isEdit),
                                          onFieldSubmitted: (data) =>
                                              Helpers.focus(context, _focusText,
                                                  _focusText),
                                          validators:
                                              FactoryValidators.multiple([
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

  void onPressed({bool? isEdit}) async {
    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      Helpers.unfocusForm(context);
      _formKey.currentState?.save();
      int createdAt = DateTime.now().millisecondsSinceEpoch;
      RegisterEntity parameters = RegisterEntity(
        content: _textController.text.toString(),
        createdAt: createdAt,
      );
      if (isEdit == true) {
        await _controller.editItem(parameters);
      } else {
        await _controller.newRegister(parameters: parameters);
      }

      _scrollDown();
    }
  }
}
