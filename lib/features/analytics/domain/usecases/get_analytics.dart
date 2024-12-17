import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/analytics_data.dart';
import '../repositories/analytics_repository.dart';

class GetAnalytics implements UseCase<AnalyticsData, AnalyticsParams> {
  final AnalyticsRepository repository;

  GetAnalytics(this.repository);

  @override
  Future<Either<Failure, AnalyticsData>> call(AnalyticsParams params) {
    return repository.getSalesAnalytics(params.startDate, params.endDate);
  }
}

class AnalyticsParams {
  final DateTime startDate;
  final DateTime endDate;

  AnalyticsParams({required this.startDate, required this.endDate});
} 