import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/analytics_metrics.dart';
import '../../domain/entities/revenue_data.dart';
import '../../domain/usecases/get_analytics.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetAnalytics getAnalytics;

  AnalyticsBloc({required this.getAnalytics}) : super(AnalyticsInitial()) {
    on<LoadAnalytics>((event, emit) async {
      emit(AnalyticsLoading());
      final result = await getAnalytics(AnalyticsParams(
        startDate: event.startDate,
        endDate: event.endDate,
      ));
      result.fold(
        (failure) => emit(const AnalyticsError(message: 'Failed to load analytics')),
        (analytics) => emit(AnalyticsLoaded(
          metrics: analytics.metrics,
          revenueData: analytics.revenueData,
        )),
      );
    });
  }
} 