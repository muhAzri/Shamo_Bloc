import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/services/transaction_service.dart';

import '../../../models/cart_model.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionPOST) {
        try {
          emit(TransactionLoading());

          final isSuccess = await TransactionService().checkout(
            event.carts,
            event.totalPrice,
          );

          emit(
            TransactionSuccess(isSuccess),
          );
        } catch (e) {
          emit(
            TransactionFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
