part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionPOST extends TransactionEvent {
  final CheckoutFormModel checkoutFormModel;

  const TransactionPOST(this.checkoutFormModel);

  @override
  List<Object> get props => [checkoutFormModel];
}
