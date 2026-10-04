class BankAccount {
  // private var is start with _
  double _balance = 0;

  double get currentBalance => this._balance;

  set deposit(double amount) {
    if (amount > 0) {
      this._balance += amount;
      print("Success: $amount deposit ");
    } else {
      print("Error");
    }
  }
}

void main(List<String> args) {
  var myAcc = BankAccount();
  myAcc.deposit = 1000;

  print("My account balance: ${myAcc.currentBalance}");
}
