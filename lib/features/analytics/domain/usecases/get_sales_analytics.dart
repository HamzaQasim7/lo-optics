import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/features/analytics/domain/repositories/analytics_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/analytics_data.dart';

class GetSalesAnalytics implements UseCase<AnalyticsData, GetSalesAnalyticsParams> {
  final AnalyticsRepository repository;

  GetSalesAnalytics(this.repository);

  @override
  Future<Either<Failure, AnalyticsData>> call(GetSalesAnalyticsParams params) async {
    return await repository.getSalesAnalytics(
      params.startDate,
      params.endDate,
    );
  }
}

class GetSalesAnalyticsParams extends Equatable {
  final DateTime startDate;
  final DateTime endDate;

  const GetSalesAnalyticsParams({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
} 