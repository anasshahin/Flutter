class PaymentSuccessModel {
  final String cardNumber;
  final String cardNameHolder;
  final String paymentDate;
  final String paymentTime;
  final String cardEmailHolder;
  final double amount;

  PaymentSuccessModel(
      {required this.cardNumber,
        required this.cardNameHolder,
        required this.paymentDate,
        required this.paymentTime,
        required this.cardEmailHolder,
        required this.amount});
}