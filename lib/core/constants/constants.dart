import '../../export.dart';

/// ********** CONSTANTS **********
const int paginationLimit = 10;

const ScrollPhysics myScrollView = ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

final _nativeToastPlugin = NativeToast();

/// ********** LOGGING UTILITIES **********
void logV(String content) {
  if (kDebugMode) {
    log(content);
  }
}

getSizeBox({double? height, double? width}) {
  return SizedBox(
    height: getVerticalSize(height ?? 0),
    width: getHorizontalSize(getHorizontalSize(width ?? 0)),
  );
}

void logResponse(
  Response response,
  String url,
  String method,
  dynamic body,
  dynamic header,
) {
  if (kDebugMode) {
    log('<-- ${response.statusCode} $method $url', name: "Request");
    log('<-- body $body');
    log('<-- header $header');
    try {
      final responseBody = json.decode(response.body);
      final prettyJson = const JsonEncoder.withIndent('  ').convert(responseBody);
      log(prettyJson, name: "Response");
    } catch (e) {
      log("Error decoding response: ${e.toString()}");
    }
  }
}

/// ********** UI HELPERS **********
void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void showInSnackBar(String message, BuildContext context) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showToast(String message, {int? maxLines}) {
  _nativeToastPlugin.showToast(
    duration: 2,
    message: message,
    textColor: Colors.black,
    backgroundColor: AppColors.white,
    fontSize: 14.0,
    gravity: ToastGravity.bottom,
    maxLines: maxLines ?? 3,
    fontFamily: AppStrings.fontFamily,
    imagePath: ImageConstants.appLogo,
  );
}

/// ********** DIALOGS **********
Future<void> showErrorDialog(
  String message, {
  String? title,
  String? buttonText,
  BuildContext? context,
  bool waitForDialogClose = false,
  Color? textColor,
}) async {
  final BuildContext? currentContext = context ?? NavigatorService.navigatorKey.currentContext;

  if (currentContext == null || !currentContext.mounted) {
    showToast(message, maxLines: 3);
    return;
  }

  Future<void> showDialog() async {
    return showCupertinoDialog(
      context: currentContext,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: title == null ? null : Text(title, style: const TextStyle(fontSize: 20)),
        content: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: NavigatorService.goBack,
            isDestructiveAction: true,
            isDefaultAction: true,
            child: Text(
              buttonText ?? "BACK",
              style: TextStyle(color: AppColors.textBlue),
            ),
          ),
        ],
      ),
    );
  }

  if (waitForDialogClose) {
    return await showDialog();
  } else {
    showDialog();
  }
}

Future<void> customAlertDialog({
  String? message,
  String? title,
  bool waitForDialogClose = false,
}) async {
  if (message != null && message.contains(AppStrings.checkInternetConnection)) {
    title = "Connection Error";
  }
  await showErrorDialog(
    message ?? AppStrings.somethingWentWrong,
    title: title ?? "Error",
    buttonText: AppStrings.cancel,
    textColor: AppColors.red,
    waitForDialogClose: waitForDialogClose,
  );
}

/// ********** NETWORK UTILITIES **********
Future<bool> isConnectionAvailable() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return !connectivityResult.contains(ConnectivityResult.none);
}

/// ********** SCREEN REFRESH **********
Future<void> onScreenRefresh(
  BuildContext context,
  Function() onRefresh, {
  bool showContinue = false,
}) async {
  logV("Refreshing...");
  final hasConnection = await isConnectionAvailable();

  if (!hasConnection) {
    await customAlertDialog(
      message: AppStrings.checkInternetConnection,
      title: "Connection Error",
      waitForDialogClose: true,
    );
    return;
  }

  if (context.mounted) {
    onRefresh();
  }
}

/// ********** EXTENSIONS **********
extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

/// ********** FORMATTERS **********
String formatPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return "-";
  }

  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  if (phoneNumber.isEmpty || phoneNumber.length != 10) {
    return phoneNumber;
  }

  return '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
}

/// ********** FILE PICKERS **********
// Future<XFile?> pickImage({
//   required ImageSource source,
//   required BuildContext context,
// }) async {
//   try {
//     return await ImagePicker().pickImage(source: source);
//   } catch (e) {
//     await showGalleryPermissionDialog(context);
//     logV("Error: $e");
//     return null;
//   }
// }

Future<FilePickerResult?> pickFiles({
  required BuildContext context,
}) async {
  try {
    return await FilePicker.platform.pickFiles();
  } catch (e) {
    await showGalleryPermissionDialog(context);
    logV("Error: $e");
    return null;
  }
}

/// ********** PERMISSIONS **********
Future<void> showGalleryPermissionDialog(BuildContext context) async {
  await showCupertinoDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => CupertinoAlertDialog(
      title: const Text('Permission Denied'),
      content: const Text('Allow access to gallery and photos'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel', style: TextStyle(color: AppColors.red)),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () async {
            await openAppSettings();
            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: Text('Settings', style: TextStyle(color: AppColors.primaryColor)),
        ),
      ],
    ),
  );
}
