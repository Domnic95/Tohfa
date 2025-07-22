import 'package:demo/features/auth/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:demo/features/auth/sign_in/presentation/bloc/sign_in_state.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../export.dart';
import '../../auth/sign_in/model/customer_site_id_model.dart';
import '../../auth/sign_up/data/model/isd_code_model.dart';
import '../../report/widget/report_screen_appbar.dart';
import '../bloc/edit_profile/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (context) => EditProfileCubit()..getISDCodeList(),
      child: EditProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customerBillPhone1 = TextEditingController();
    IsdCodeModel? customerBillPhone1Code;
    final formKey = GlobalKey<FormState>();
    bool autoValidate = false;

    final customerBillPhone2 = TextEditingController();
    IsdCodeModel? customerBillPhone2Code;
    final customerBillPhone3 = TextEditingController();
    IsdCodeModel? customerBillPhone3Code;
    final customerBillDefaultWhatsapp = TextEditingController();
    IsdCodeModel? customerBillDefaultWhatsappCode;
    final customerBillWhatsappNo1 = TextEditingController();
    IsdCodeModel? customerBillWhatsappNo1Code;
    final customerBillWhatsappNo2 = TextEditingController();
    IsdCodeModel? customerBillWhatsappNo2Code;
    final customerBillWhatsappNo3 = TextEditingController();
    IsdCodeModel? customerBillWhatsappNo3Code;
    final customerBillEmail = TextEditingController();
    final customerShipPhone1 = TextEditingController();
    IsdCodeModel? customerShipPhone1Code;
    final customerShipPhone2 = TextEditingController();
    IsdCodeModel? customerShipPhone2Code;
    final customerShipPhone3 = TextEditingController();
    IsdCodeModel? customerShipPhone3Code;
    final customerShipDefaultWhatsapp = TextEditingController();
    IsdCodeModel? customerShipDefaultWhatsappCode;
    final customerShipWhatsappNo1 = TextEditingController();
    IsdCodeModel? customerShipWhatsappNo1Code;
    final customerShipWhatsappNo2 = TextEditingController();
    IsdCodeModel? customerShipWhatsappNo2Code;
    final customerShipWhatsappNo3 = TextEditingController();
    IsdCodeModel? customerShipWhatsappNo3Code;
    final customerShipEmail = TextEditingController();
// Bill side controllers
    final billPanCard = TextEditingController();
    final customerBillGstin = TextEditingController();

// Ship side controllers
    final shipPanCard = TextEditingController();
    final customerShipGstin = TextEditingController();

// Editable flags
    bool billPanCardEditable = false;
    bool customerBillGstinEditable = false;
    bool shipPanCardEditable = false;
    bool customerShipGstinEditable = false;
    CustomerSiteIdModel? tempData;
    tempData = Singleton.instance.userData;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Your Profile"),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          // tempData = Singleton.instance.userData;
        },
        builder: (context, state) {
          // tempData = Singleton.instance.userData;
          log("-=-=--11111 ${tempData?.toJson().toString()}");
          log("-=-=--customer_ship_state_name ${tempData?.customerShipStateName}");
          log("-=-=--customer_ship_state_ ${tempData?.customerShipState}");
          final bloc = context.read<EditProfileCubit>();
          if (!bloc.isValueSet && state is EditProfileValueChangeState) {
            customerBillPhone1.text = tempData?.customerBillPhone1 ?? "";
            customerBillPhone2.text = tempData?.customerBillPhone2 ?? "";
            customerBillPhone3.text = tempData?.customerBillPhone3 ?? "";
            customerBillDefaultWhatsapp.text = tempData?.customerBillDefaultWhatsapp ?? "";
            customerBillWhatsappNo1.text = tempData?.customerBillWhatsappNo1 ?? "";
            customerBillWhatsappNo2.text = tempData?.customerBillWhatsappNo2 ?? "";
            customerBillWhatsappNo3.text = tempData?.customerBillWhatsappNo3 ?? "";
            customerBillEmail.text = tempData?.customerBillEmail ?? "";
            customerShipPhone1.text = tempData?.customerShipPhone1 ?? "";
            customerShipPhone2.text = tempData?.customerShipPhone2 ?? "";
            customerShipPhone3.text = tempData?.customerShipPhone3 ?? "";
            customerShipDefaultWhatsapp.text = tempData?.customerShipDefaultWhatsapp ?? "";
            customerShipWhatsappNo1.text = tempData?.customerShipWhatsappNo1 ?? "";
            customerShipWhatsappNo2.text = tempData?.customerShipWhatsappNo2 ?? "";
            customerShipWhatsappNo3.text = tempData?.customerShipWhatsappNo3 ?? "";
            customerShipEmail.text = tempData?.customerShipEmail ?? "";
            billPanCard.text = tempData?.billPanCard ?? "";
            customerBillGstin.text = tempData?.customerBillGstin ?? "";
            customerShipGstin.text = tempData?.customerShipGstin ?? "";
            shipPanCard.text = tempData?.shipPanCard ?? "";
            billPanCardEditable = billPanCard.text.trim().isEmpty;
            customerBillGstinEditable = customerBillGstin.text.trim().isEmpty;
            shipPanCardEditable = shipPanCard.text.trim().isEmpty;
            customerShipGstinEditable = customerShipGstin.text.trim().isEmpty;
            void setPhoneAndCode(String? phoneWithCode, TextEditingController controller,
                void Function(IsdCodeModel) setCode) {
              if (phoneWithCode != null && phoneWithCode.isNotEmpty) {
                final parts = phoneWithCode.split(" ");
                if (parts.length == 2) {
                  try {
                    final code = bloc.isdCodeModelList.firstWhere((e) => e.value == parts[0]);
                    setCode(code);
                    controller.text = parts[1]; // just the number part in controller
                  } catch (e) {
                    // fallback if not found
                    final defaultCode = bloc.isdCodeModelList.firstWhere((e) => e.value == "+91");
                    setCode(defaultCode);
                    controller.text = phoneWithCode; // fallback whole string
                  }
                } else {
                  // no space found, fallback behavior
                  final defaultCode = bloc.isdCodeModelList.firstWhere((e) => e.value == "+91");
                  setCode(defaultCode);
                  controller.text = phoneWithCode;
                }
              } else {
                controller.text = "";
                final defaultCode = bloc.isdCodeModelList.firstWhere((e) => e.value == "+91");
                setCode(defaultCode);
              }
            }

            setPhoneAndCode(tempData?.customerBillPhone1, customerBillPhone1,
                (code) => customerBillPhone1Code = code);
            setPhoneAndCode(tempData?.customerBillPhone2, customerBillPhone2,
                (code) => customerBillPhone2Code = code);
            setPhoneAndCode(tempData?.customerBillPhone3, customerBillPhone3,
                (code) => customerBillPhone3Code = code);
            setPhoneAndCode(tempData?.customerBillDefaultWhatsapp, customerBillDefaultWhatsapp,
                (code) => customerBillDefaultWhatsappCode = code);
            setPhoneAndCode(tempData?.customerBillWhatsappNo1, customerBillWhatsappNo1,
                (code) => customerBillWhatsappNo1Code = code);
            setPhoneAndCode(tempData?.customerBillWhatsappNo2, customerBillWhatsappNo2,
                (code) => customerBillWhatsappNo2Code = code);
            setPhoneAndCode(tempData?.customerBillWhatsappNo3, customerBillWhatsappNo3,
                (code) => customerBillWhatsappNo3Code = code);
            // For emails no ISD code needed
            customerBillEmail.text = tempData?.customerBillEmail ?? "";

            setPhoneAndCode(tempData?.customerShipPhone1, customerShipPhone1,
                (code) => customerShipPhone1Code = code);
            setPhoneAndCode(tempData?.customerShipPhone2, customerShipPhone2,
                (code) => customerShipPhone2Code = code);
            setPhoneAndCode(tempData?.customerShipPhone3, customerShipPhone3,
                (code) => customerShipPhone3Code = code);
            setPhoneAndCode(tempData?.customerShipDefaultWhatsapp, customerShipDefaultWhatsapp,
                (code) => customerShipDefaultWhatsappCode = code);
            setPhoneAndCode(tempData?.customerShipWhatsappNo1, customerShipWhatsappNo1,
                (code) => customerShipWhatsappNo1Code = code);
            setPhoneAndCode(tempData?.customerShipWhatsappNo2, customerShipWhatsappNo2,
                (code) => customerShipWhatsappNo2Code = code);
            setPhoneAndCode(tempData?.customerShipWhatsappNo3, customerShipWhatsappNo3,
                (code) => customerShipWhatsappNo3Code = code);
            // For emails no ISD code needed
            customerShipEmail.text = tempData?.customerShipEmail ?? "";
            bloc.isValueSet = true;
          }
          log("-=-===-=-=-=-=-==-=-=-=-=-=- ${tempData?.customerShipStateName ?? "DEMOOOO"}");
          return Form(
            key: formKey,
            autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: getPadding(left: 26, right: 26, top: 26),
                        child: Column(
                          spacing: getSize(40),
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: getSize(15),
                              children: [
                                ///new
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillPhone1,
                                  "Customer Bill Phone 1",
                                  customerBillPhone1Code,
                                  (selectedModel) => customerBillPhone1Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillPhone2,
                                  "Customer Bill Phone 2",
                                  customerBillPhone2Code,
                                  (selectedModel) => customerBillPhone2Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillPhone3,
                                  "Customer Bill Phone 3",
                                  customerBillPhone3Code,
                                  (selectedModel) => customerBillPhone3Code = selectedModel,
                                ),
                                _buildReadOnlyField(
                                  labelText: "Default WhatsApp",
                                  value:
                                      "${customerBillDefaultWhatsappCode?.value} ${customerBillDefaultWhatsapp.text}",
                                ),
                                // _phoneNumberBuilder(
                                //   bloc,
                                //   customerBillDefaultWhatsapp,
                                //   "Default WhatsApp",
                                //   customerBillDefaultWhatsappCode,
                                //   (selectedModel) =>
                                //       customerBillDefaultWhatsappCode = selectedModel,
                                // ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillWhatsappNo1,
                                  "Customer Bill WhatsApp No 1",
                                  customerBillWhatsappNo1Code,
                                  (selectedModel) => customerBillWhatsappNo1Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillWhatsappNo2,
                                  "Customer Bill WhatsApp No 2",
                                  customerBillWhatsappNo2Code,
                                  (selectedModel) => customerBillWhatsappNo2Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerBillWhatsappNo3,
                                  "Customer Bill WhatsApp No 3",
                                  customerBillWhatsappNo3Code,
                                  (selectedModel) => customerBillWhatsappNo3Code = selectedModel,
                                ),

                                _emailBuilder(
                                  customerBillEmail,
                                  "Customer Bill Email",
                                ),

                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipPhone1,
                                  "Customer Ship Phone1",
                                  customerShipPhone1Code,
                                  (selectedModel) => customerShipPhone1Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipPhone2,
                                  "Customer Ship Phone2",
                                  customerShipPhone2Code,
                                  (selectedModel) => customerShipPhone2Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipPhone3,
                                  "Customer Ship Phone3",
                                  customerShipPhone3Code,
                                  (selectedModel) => customerShipPhone3Code = selectedModel,
                                ),

                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipDefaultWhatsapp,
                                  "Customer Ship Default Whatsapp",
                                  customerShipDefaultWhatsappCode,
                                  (selectedModel) =>
                                      customerShipDefaultWhatsappCode = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipWhatsappNo1,
                                  "Customer Ship Whatsapp No1",
                                  customerShipWhatsappNo1Code,
                                  (selectedModel) => customerShipWhatsappNo1Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipWhatsappNo2,
                                  "Customer Ship Whatsapp No2",
                                  customerShipWhatsappNo2Code,
                                  (selectedModel) => customerShipWhatsappNo2Code = selectedModel,
                                ),
                                _phoneNumberBuilder(
                                  bloc,
                                  customerShipWhatsappNo3,
                                  "Customer Ship Whatsapp No3",
                                  customerShipWhatsappNo3Code,
                                  (selectedModel) => customerShipWhatsappNo3Code = selectedModel,
                                ),

                                _emailBuilder(
                                  customerShipEmail,
                                  "Customer Ship Email",
                                ),

                                ///Read only
                                _buildReadOnlyField(
                                    labelText: "Customer Bill PAN Card",
                                    value: tempData?.billPanCard ?? "",
                                    controller: billPanCard,
                                    isReadOnly: !billPanCardEditable),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill GSTIN",
                                    value: tempData?.customerBillGstin ?? "",
                                    controller: customerBillGstin,
                                    isReadOnly: !customerBillGstinEditable),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship PAN Card",
                                    value: tempData?.shipPanCard ?? "",
                                    controller: shipPanCard,
                                    isReadOnly: !shipPanCardEditable),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship GSTIN",
                                    value: tempData?.customerShipGstin ?? "",
                                    controller: customerShipGstin,
                                    isReadOnly: !customerShipGstinEditable),
                                _buildReadOnlyField(
                                  labelText: "Trade group",
                                  value: tempData?.tradeGroupName?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                    labelText: "customer site name",
                                    value: tempData?.customerSiteName ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer site short name",
                                    value: tempData?.customerSiteShortName ?? ""),
                                _buildReadOnlyField(
                                  labelText: "Transporter name",
                                  value: tempData?.transporterName?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                  labelText: "Price list",
                                  value: tempData?.priceList?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                  labelText: "Trade group",
                                  value: tempData?.tradeGroupName?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                  labelText: "Transaction term",
                                  value: tempData?.transactionTerm?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                  labelText: "Agent name",
                                  value: tempData?.agentName?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                  labelText: "Agent percentage",
                                  value: tempData?.agentPercentage?.toString() ?? "",
                                ),
                                _buildReadOnlyField(
                                    labelText: "Bill Contact Person",
                                    value: tempData?.billContactPerson ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Bill Contact No",
                                    value: tempData?.billContactNo ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Address 2",
                                    value: tempData?.customerBillAddress2 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Landmark",
                                    value: tempData?.customerBillLandmark ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Area", value: tempData?.customerBillArea ?? ""),
                                _buildReadOnlyField(
                                    labelText: "District",
                                    value: tempData?.customerBillDistrict ?? ""),
                                _buildReadOnlyField(
                                    labelText: "STD Code",
                                    value: tempData?.customerBillStdCode ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Alternate Email",
                                    value: tempData?.customerBillAlternateEmail ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Website",
                                    value: tempData?.customerBillWebsite ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Bill Contact Person",
                                    value: tempData?.billContactPerson ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Bill Contact No",
                                    value: tempData?.billContactNo ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Address 1",
                                    value: tempData?.customerBillAddress1 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Address 2",
                                    value: tempData?.customerBillAddress2 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Landmark",
                                    value: tempData?.customerBillLandmark ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Area",
                                    value: tempData?.customerBillArea ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill District",
                                    value: tempData?.customerBillDistrict ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill City",
                                    value: tempData?.customerBillCityName ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill pincode",
                                    value: tempData?.customerBillPincode ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill ISD Code",
                                    value: tempData?.customerBillIsdCode ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill STD Code",
                                    value: tempData?.customerBillStdCode ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Customer Bill Phone 1",
                                    value: tempData?.customerBillPhone1 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Phone 2",
                                    value: tempData?.customerBillPhone2 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Phone 3",
                                    value: tempData?.customerBillPhone3 ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Customer Bill Default WhatsApp",
                                    value: tempData?.customerBillDefaultWhatsapp ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill WhatsApp No 1",
                                    value: tempData?.customerBillWhatsappNo1 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill WhatsApp No 2",
                                    value: tempData?.customerBillWhatsappNo2 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill WhatsApp No 3",
                                    value: tempData?.customerBillWhatsappNo3 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Alternate Email",
                                    value: tempData?.customerBillAlternateEmail ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill Website",
                                    value: tempData?.customerBillWebsite ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Customer Bill GSTIN Date",
                                    value: tempData?.customerBillGstinDate ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Bill GST State",
                                    value: tempData?.customerBillGstStateName ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Ship Contact Person",
                                    value: tempData?.shipContactPerson ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Ship Contact No",
                                    value: tempData?.shipContactNo ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Address1",
                                    value: tempData?.customerShipAddress1 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Address2",
                                    value: tempData?.customerShipAddress2 ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Landmark",
                                    value: tempData?.customerShipLandmark ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Area",
                                    value: tempData?.customerShipArea ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship District",
                                    value: tempData?.customerShipDistrict ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Pincode",
                                    value: tempData?.customerShipPincode ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship City",
                                    value: tempData?.customerShipCityName ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship State",
                                    value: tempData?.customerShipStateName ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Customer Ship Country",
                                    value: tempData?.customerShipCountryName ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Isd Code",
                                    value: tempData?.customerShipIsdCode ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Std Code",
                                    value: tempData?.customerShipStdCode ?? ""),

                                _buildReadOnlyField(
                                    labelText: "Customer Ship Alternate Email",
                                    value: tempData?.customerShipAlternateEmail ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Website",
                                    value: tempData?.customerShipWebsite ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Gstin",
                                    value: tempData?.customerShipGstin ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Gstin Date",
                                    value: tempData?.customerShipGstinDate ?? ""),
                                _buildReadOnlyField(
                                    labelText: "Customer Ship Gst State",
                                    value: tempData?.customerShipGstStateName ?? ""),

                                _buildReadOnlyField(
                                    labelText: "GSTIN Date",
                                    value: tempData?.customerBillGstinDate ?? ""),
                                _buildReadOnlyField(
                                    labelText: "GST State",
                                    value: tempData?.customerBillGstStateName ?? ""),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 15, right: 15, bottom: 10, top: 5),
                      child: Center(
                        child: BlocProvider<SignInCubit>(
                          create: (context) => SignInCubit(false),
                          child: BlocConsumer<SignInCubit, SignInState>(
                            listener: (context, state1) {},
                            builder: (context, state1) {
                              return state1 is SignInLoadingState ||
                                      state is EditProfileLoadingState
                                  ? CustomButton(
                                      onPressed: () {},
                                      text: '',
                                      child: CircularProgressIndicator.adaptive(
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : CustomButton(
                                      text: "Save Changes",
                                      onPressed: () {
                                        autoValidate = true;
                                        bloc.onValueChange();
                                        if (formKey.currentState!.validate()) {
                                          Map<String, String> body = {
                                            "id": Singleton.instance.userData?.id.toString() ?? "",
                                            "customer_bill_email": customerBillEmail.text,
                                            "customer_bill_phone1": customerBillPhone1.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillPhone1Code?.value} ${customerBillPhone1.text.trim()}",
                                            "customer_bill_phone2": customerBillPhone2.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillPhone2Code?.value} ${customerBillPhone2.text.trim()}",
                                            "customer_bill_phone3": customerBillPhone3.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillPhone3Code?.value} ${customerBillPhone3.text.trim()}",
                                            "customer_bill_whatsapp_no1": customerBillWhatsappNo1
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillWhatsappNo1Code?.value} ${customerBillWhatsappNo1.text.trim()}",
                                            "customer_bill_whatsapp_no2": customerBillWhatsappNo2
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillWhatsappNo2Code?.value} ${customerBillWhatsappNo2.text.trim()}",
                                            "customer_bill_whatsapp_no3": customerBillWhatsappNo3
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerBillWhatsappNo3Code?.value} ${customerBillWhatsappNo3.text.trim()}",
                                            "customer_bill_default_whatsapp":
                                                customerBillDefaultWhatsapp.text.trim().isEmpty
                                                    ? ""
                                                    : "${customerBillDefaultWhatsappCode?.value} ${customerBillDefaultWhatsapp.text.trim()}",
                                            "bill_pan_card": billPanCard.text,
                                            "customer_bill_gstin": customerBillGstin.text,
                                            "customer_ship_email": customerShipEmail.text,
                                            "customer_ship_phone1": customerShipPhone1.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipPhone1Code?.value} ${customerShipPhone1.text.trim()}",
                                            "customer_ship_phone2": customerShipPhone2.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipPhone2Code?.value} ${customerShipPhone2.text.trim()}",
                                            "customer_ship_phone3": customerShipPhone3.text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipPhone3Code?.value} ${customerShipPhone3.text.trim()}",
                                            "customer_ship_whatsapp_no1": customerShipWhatsappNo1
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipWhatsappNo1Code?.value} ${customerShipWhatsappNo1.text.trim()}",
                                            "customer_ship_whatsapp_no2": customerShipWhatsappNo2
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipWhatsappNo2Code?.value} ${customerShipWhatsappNo2.text.trim()}",
                                            "customer_ship_whatsapp_no3": customerShipWhatsappNo3
                                                    .text
                                                    .trim()
                                                    .isEmpty
                                                ? ""
                                                : "${customerShipWhatsappNo3Code?.value} ${customerShipWhatsappNo3.text.trim()}",
                                            "customer_ship_default_whatsapp":
                                                customerShipDefaultWhatsapp.text.trim().isEmpty
                                                    ? ""
                                                    : "${customerShipDefaultWhatsappCode?.value} ${customerShipDefaultWhatsapp.text.trim()}",
                                            "ship_pan_card": shipPanCard.text,
                                            "customer_ship_gstin": customerShipGstin.text,
                                          };
                                          log("${customerBillDefaultWhatsappCode?.value} - ${tempData?.billContactNo ?? ""}");
                                          final bloc1 = context.read<SignInCubit>();
                                          bloc1.sendOtp(tempData?.billContactNo ?? "",
                                              customerBillDefaultWhatsappCode?.value ?? "+91",
                                              isFromEditProfile: true,
                                              context: context,
                                              bodyForUpdateProfile: body);

                                          // bloc.updateProfile(body);
                                        }
                                      },
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                    visible: state is EditProfileLoadingState,
                    child: Container(
                      color: AppColors.primaryColorDark.withValues(alpha: .2),
                      child: CustomLoading(),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _phoneNumberBuilder(EditProfileCubit bloc, TextEditingController controller, String title,
    IsdCodeModel? selectedModel, Function(IsdCodeModel? selectedModel) onChange) {
  return Row(
    spacing: getSize(5),
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Expanded(
      //     flex: 4,
      //     child: customDropDown2(
      //       height2: getSize(47),
      //       bloc.isdCodeModelList,
      //       (p0) => p0.value ?? "",
      //       onChanged: (value) {
      //         onChange.call(value);
      //         selectedModel = value;
      //         bloc.onValueChange();
      //       },
      //       customLabel: SizedBox(),
      //       valueText: selectedModel?.value,
      //     )),
      Expanded(
        flex: 10,
        child: AppTextField(
          inputFormatters: [
            Validation.maxLength(maxLength: 10),
            Validation.allowOnlyNumbers(),
          ],
          validator: (value) {
            if (value != null && value.isNotEmpty && value.length != 10) {
              return "Invalid ${title.toLowerCase()}";
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          labelText: title,
          controller: controller,
          hintText: "Enter ${title.toLowerCase()}",
        ),
      )
    ],
  );
}

Widget _emailBuilder(
  TextEditingController controller,
  String title,
) {
  return AppTextField(
    inputFormatters: [
      Validation.maxLength(maxLength: 10),
      Validation.allowOnlyNumbers(),
    ],
    validator: (value) {
      if (value != null && value.isNotEmpty && !Validation.emailValidation(email: value)) {
        return "Invalid email address";
      }
      return null;
    },
    keyboardType: TextInputType.phone,
    labelText: title,
    controller: controller,
    hintText: "Enter ${title.toLowerCase()}",
  );
}

Widget _buildReadOnlyField(
    {required String labelText,
    String? value,
    bool isReadOnly = true,
    TextEditingController? controller}) {
  return AppTextField(
    labelText: labelText,
    readOnly: isReadOnly,
    controller: controller ?? TextEditingController(text: value ?? ""),
  );
}
