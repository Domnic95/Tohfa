import 'package:demo/export.dart';
import 'package:demo/features/report/screens/token_screen.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:url_launcher/url_launcher.dart';
import '../../../home/screens/home_screen.dart';
import '../../../profile/screens/profile_screen.dart';
import '../../../qr/qr_screen.dart';
import '../../../report/screens/notification_screen.dart';
import '../../../report/screens/report_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<DashBoardBloc>(
      create: (context) => DashBoardBloc()
        ..add(DashBoardInItEvent(Singleton.instance.dashBoardIndex)),
      child: const DashBoardScreen(),
    );
  }

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<DashBoardModel> _pageList = [
    DashBoardModel(
      imagePath: ImageConstants.icHome,
      title: "Home",
      page: HomeScreen.builder,
    ),
    DashBoardModel(
      imagePath: ImageConstants.icQR,
      title: "QR",
      page: QrScreen.builder,
    ),
    DashBoardModel(
      imagePath: ImageConstants.icReport,
      title: "Report",
      page: ReportScreen.builder,
    ),
    DashBoardModel(
      imagePath: ImageConstants.person,
      title: "Profile",
      page: ProfileScreen.builder,
    ),
  ];

  late List<Widget?> _pages; // Will hold initialized pages

  @override
  void initState() {
    super.initState();
    _pages = List.filled(_pageList.length, null); // Initialize with nulls
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        // Initialize only the current page if not already initialized
        _pages[state.selectedIndex] ??=
            _pageList[state.selectedIndex].page(context);

        return Scaffold(
          appBar: _buildAppBar(_pageList[state.selectedIndex].title),
          backgroundColor: AppColors.bgColor,
          body: _pages[state.selectedIndex] ?? Container(), // Show current page
          bottomNavigationBar:
              _buildCustomBottomNavBar(state.selectedIndex, context),
        );
      },
    );
  }

  Widget _buildCustomBottomNavBar(int currentIndex, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(getSize(20)),
        topRight: Radius.circular(getSize(20)),
      ),
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          top: getSize(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _pageList.asMap().entries.map((entry) {
            int idx = entry.key;
            var item = entry.value;
            bool isSelected = currentIndex == idx;

            return InkWell(
              onTap: () {
                HapticFeedback.lightImpact();
                context
                    .read<DashBoardBloc>()
                    .add(DashBoardIndexChangeEvent(idx));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  CustomImageView(
                    imagePath: item.imagePath,
                    height: getSize(24),
                    width: getSize(24),
                    fit: BoxFit.fill,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withOpacity(0.5),
                  ),

                  SizedBox(height: getSize(4)),

                  // Label
                  CustomText(
                    text: item.title,
                    style: CustomTextStyle.bodyText.copyWith(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withOpacity(0.5),
                      fontSize: getSize(12),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  // Custom indicator
                  isSelected
                      ? Container(
                          height: getSize(3),
                          width: getSize(35),
                          margin: EdgeInsets.only(top: getSize(4)),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(getSize(2)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.84),
                                blurRadius: getSize(7),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(height: getSize(7)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leadingWidth: getSize(120),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(left: 10),
            child: CustomImageView(
              imagePath: ImageConstants.appLogo2,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: CustomImageView(
            imagePath: ImageConstants.phone,
            color: AppColors.primaryColor,
            height: 20,
            width: 20,
          ),
          onPressed: () async {
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: "+919029319993",
            );
            await launchUrl(launchUri);
          },
        ),
        IconButton(
          icon: CustomImageView(
            imagePath: ImageConstants.token,
            // color: AppColors.primaryColor,
            height: 20,
            width: 20,
          ),
          onPressed: () {
            NavigatorService.push(context, TokenScreen.builder(context));
          },
        ),
        BlocBuilder<DashBoardBloc, DashBoardState>(
          builder: (context, state) {
            final count = context.read<DashBoardBloc>().notificationCount;
            return ValueListenableBuilder(
                valueListenable: count,
                builder: (context, _, __) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        icon: CustomImageView(
                          imagePath: ImageConstants.notification,
                          color: AppColors.primaryColor,
                          height: 20,
                          width: 20,
                        ),
                        onPressed: () {
                          NavigatorService.push(
                              context, NotificationScreen.builder(context));
                        },
                      ),
                      if (_ > 0)
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                                minWidth: 15, minHeight: 15),
                            child: Center(
                              child: Text(
                                '$_',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                });
          },
        ),
        getSizeBox(width: 8),
      ],
    );
  }
}
