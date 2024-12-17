import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/sale.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/sale_repository.dart';

class CreateSale implements UseCase<Sale, CreateSaleParams> {
  final SaleRepository repository;

  CreateSale(this.repository);

  @override
  Future<Either<Failure, Sale>> call(CreateSaleParams params) async {
    return await repository.createSale(params.sale);
  }
}

class CreateSaleParams extends Equatable {
  final Sale sale;

  const CreateSaleParams({required this.sale});

  @override
  List<Object?> get props => [sale];
} 