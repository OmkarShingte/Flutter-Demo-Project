void main() {
  var a = aa();
  a.eat();
}

class Animal {
  Animal(){
    print("Animal constructor");

  }
  void eat() {
    print("Animal is eating");
  }
  void eating() {
    print("Animal is eatingggggg");
  }
}

class aa implements Animal {
  void eat() {
    print("aa is eating");
  }
  void eating() {
    // TODO: implement eating
  }
}
