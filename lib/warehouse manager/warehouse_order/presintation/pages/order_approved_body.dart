import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/warehouse_order_model.dart';
import '../bloc/warehouse_orders_bloc.dart';

// ignore: must_be_immutable
class OrderApprovedBody extends StatelessWidget {
  OrderApprovedBody({super.key});
  List<WarehouseOrdersDataModel>? warehouseApprovedData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseOrdersBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseOrdersBloc, WarehouseOrdersState>(
          listener: (context, state) {
            if (state is WarehouseApprovedOrdersSuccess) {
              warehouseApprovedData = state.warehouseOrdersModel.data;
              print(warehouseApprovedData?.length ?? "SSSSSSSSSS");
            }
          },
          builder: (context, state) {
            if (state is WarehouseOrdersInitial) {
              context
                  .read<WarehouseOrdersBloc>()
                  .add(GetApprovedEvent(context.read<AuthBloc>().token ?? ''));
            }
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: warehouseApprovedData?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                CustomCardMovementWidget(
                                    height: 250.h,
                                    firstTextField:
                                        warehouseApprovedData?[index]
                                                .investor?[0]
                                                .name ??
                                            "Investor",
                                    secondTextField:
                                        warehouseApprovedData?[index]
                                                .requestDate ??
                                            "20/08/2023",
                                    quantityTextField:
                                        warehouseApprovedData?[index]
                                                .quantity
                                                .toString() ??
                                            "00",
                                    customWidget: const SizedBox.shrink()),
                                SizedBox(
                                  height: 30.h,
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
                if (state is WarehouseOrdersLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseRejectSuccess &&
                    warehouseApprovedData!.isEmpty)
                  EmptyWidget(height: 1.sh - 0.3.sh)
              ],
            );
          },
        ),
      ),
    );
  }
}
