class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  void vroom(){
    print("Vroom Vroom");
  }
}

class ElectricCar extends Car {
  int batteryLife = 100;

  ElectricCar(super.brand, super.model, super.year);
}

void main() {
  Car myCar = Car('Toyota', 'Executive', 2002);

  print(myCar.brand);
  print(myCar.model);
  print(myCar.year);

  myCar.vroom();

  ElectricCar tesla = ElectricCar('tesla', 'plaid', 2002);
  print(tesla.brand);
  print(tesla.batteryLife);

}
