class MainClass {
  int number = 10;
  String text = "Hello World!";
  double decimal = 3.14;
  boolean isTrue = true;
 
  
  var camelCaseNumber = number;
  var snakeCaseText = text;
  var pascalCaseDecimal = decimal;

  String name = "John";
  String surname = "Doe";
  int age = 30;
  boolean isGraduated = true;

}
  void printAll() {
    print("number"+ $number);
    print("text:"+ $text);
    print("decimal:"+ $decimal);
    print("trueFalse:"+ $trueFalse);

    print("camelCaseNumber: "+$camelCaseNumber);
    print("'snakeCaseText:"+ $snakeCaseText);
    print("pascalCaseDecimal:"+ $pascalCaseDecimal);

    print("Name: "+ $name);
    print("Surname: "+$surname);
    print("Age: "+$age);
    print("Is graduated?:"+ $isGraduated);
  }

void main() {
  MainClass mainClass = MainClass();
  mainClass.printAll();
 
}