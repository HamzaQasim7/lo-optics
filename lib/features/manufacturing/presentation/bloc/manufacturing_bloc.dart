import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/manufacturing_order.dart';
import '../../domain/usecases/get_manufacturing_order.dart';
import '../../domain/usecases/update_manufacturing_status.dart';

part 'manufacturing_event.dart';
part 'manufacturing_state.dart';

class ManufacturingBloc extends Bloc<ManufacturingEvent, ManufacturingState> {
  final GetManufacturingOrder getOrder;
  final UpdateManufacturingStatus updateStatus;

  ManufacturingBloc({
    required this.getOrder,
    required this.updateStatus,
  }) : super(ManufacturingInitial()) {
    on<LoadManufacturingOrder>((event, emit) async {
      emit(ManufacturingLoading());
      final result = await getOrder(event.orderId);
      result.fold(
        (failure) =>
            emit(const ManufacturingError(message: 'Failed to load order')),
        (order) => emit(ManufacturingOrderLoaded(order)),
      );
    });

    on<UpdateManufacturingStatusEvent>((event, emit) async {
      emit(ManufacturingLoading());
      final result = await updateStatus(
        UpdateManufacturingStatusParams(
          orderId: event.orderId,
          newStatus: event.newStatus,
        ),
      );
      result.fold(
        (failure) =>
            emit(const ManufacturingError(message: 'Failed to update status')),
        (order) => emit(ManufacturingOrderLoaded(order)),
      );
    });
  }
}
