import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/color_manager.dart';
import 'delivery_history_body_page.dart';
import 'delivery_requests_body_page.dart';

class DeliveryHomePage extends StatefulWidget {
  const DeliveryHomePage({super.key});

  @override
  State<DeliveryHomePage> createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
//for tabBar

  TabBar get _tabBar => TabBar(
        labelColor: ColorManager.black,
        unselectedLabelColor: ColorManager.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: ColorManager.black,
        tabs: const [
          Tab(
            icon: SizedBox(
                width: 200,
                child: Text(
                  //TODO: must put in string manager
                  'Requests',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Tab(
            icon: SizedBox(
                width: 200,
                child: Text(
                  //TODO: must put in string manager
                  'Pending',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Tab(
            icon: SizedBox(
                width: 200,
                child: Text(
                  //TODO: must put in string manager
                  'History',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.backgroundL,
          title: Text(
            'Orders',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.black,
              fontSize: 50.sp,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: ColorManager.backgroundL,
              child: _tabBar,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            //began
            DeliveryRequestBodyPage(),
            //End

            //began
            Center(
              child: Text("Must implement"),
            ),
            //End

            //began
            DeliveryHistoryBodyPage()
            //End
          ],
        ),
      ),
    );
  }
}
