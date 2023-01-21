part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionPOST extends TransactionEvent {
  final List<CartModel> carts;
  final double totalPrice;

  const TransactionPOST(this.carts, this.totalPrice);

  @override
  List<Object> get props => [carts,totalPrice];
}
