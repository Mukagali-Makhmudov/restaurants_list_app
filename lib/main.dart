void main(){
  Car car = Lexus();
  car.name = "gs 300";
}

class Car{
  Car(this.name);
  String name;
}

class Lexus implements Car{
  
}