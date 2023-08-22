import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jessy_mall/core/widgets/custom_counter.dart';

class CartCard extends StatelessWidget {
  String? price;
  bool delete;
  CartCard({
    Key? key,
    this.price,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 300.h,
        width: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 250.h,
                    width: 250.w,
                    color: Colors.black,
                  )
                  /*  Image.network(
                  "data:image/jpeg;base64,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",
                  fit: BoxFit.fill,
                  height: 250.h,
                  width: 250.w,
                ),
            */
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minimal Stand',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  price ?? "",
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                // Counter(
                //   x: 1,
                // )
              ],
            ),
            const Spacer(),
            delete
                ? const Icon(Icons.highlight_remove_outlined)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
