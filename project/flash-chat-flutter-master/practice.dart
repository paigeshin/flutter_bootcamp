void main(){

//  Animal().move();
//  Fish().move();
//  Bird().move();

    //from parent class
    Duck().move();

    //from mixin
    Duck().swim();
    Duck().fly();

}

class Animal {

  void move(){
    print('Changed Position');
  }

}

class Fish extends Animal {

  @override
  void move() {
    super.move();
    print('by swimming');
  }

}

class Bird extends Animal {

  @override
  void move() {
    super.move();
    print('by flying');
  }

}


mixin CanSwim {
  void swim(){
    print('Changing position by Swwimming');
  }
}

mixin CanFly {
  void fly(){
    print('Changing position by flying');
  }
}

class Duck extends Animal with CanSwim, CanFly {

}

class AirPlane with CanFly {

}