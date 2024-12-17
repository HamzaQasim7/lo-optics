import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/analytics_data.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../datasources/analytics_remote_data_source.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsRemoteDataSource remoteDataSource;

  AnalyticsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AnalyticsData>> getSalesAnalytics(DateTime startDate, DateTime endDate) async {
    try {
      final analyticsData = await remoteDataSource.getSalesAnalytics(startDate, endDate);
      return Right(analyticsData); // Return the analytics data wrapped in Right
    } catch (e) {
      return Left(Failure(message: e.toString())); // Handle the error and return a Failure
    }
  }
} 