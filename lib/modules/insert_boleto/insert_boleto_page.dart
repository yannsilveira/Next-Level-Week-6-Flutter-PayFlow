import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_Navigator_Buttons/bottom_navigator_buttons.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';

class InsertBoletopPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletopPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletopPageState createState() => _InsertBoletopPageState();
}

class _InsertBoletopPageState extends State<InsertBoletopPage> {
  final controller = InsertBoletoController();

  final moneyInputTextcontroller =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                child: Text(
                  "Preencher os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        label: "Nome do Boleto",
                        icon: Icons.description_outlined,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        validators: controller.validateName,
                      ),
                      InputTextWidget(
                        controller: dueDateInputTextController,
                        label: "Vencimento",
                        icon: FontAwesomeIcons.timesCircle,
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                        validators: controller.validateVencimento,
                      ),
                      InputTextWidget(
                        controller: moneyInputTextcontroller,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextcontroller.numberValue);
                        },
                        validators: (_) => controller.validateValor(
                            moneyInputTextcontroller.numberValue),
                      ),
                      InputTextWidget(
                        controller: barcodeInputTextController,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                        validators: controller.validateCodigo,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorButtonsWidget(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        enableSecondaryColor: true,
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
      ),
    );
  }
}
