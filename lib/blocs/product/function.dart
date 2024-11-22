//give me example of a regular function
void printHello() {
  print('Hello');
  print("World");
}

//give me example of a arrow function
void printHelloArrow() => print('Hello Arrow');

//give me example of a arrow function with parameter
void printHelloArrowWithParameter(String name) => print('Hello $name');

//give me example of a regular function with parameter
void printHelloWithParameter(String name) {
  print('Hello $name');
}

//give me example of a regular function with named parameters
void printHelloWithNamedParameter({String? name = 'World'}) {
  print('Hello $name');
}

//give me example of a regular function with optional parameters
void printHelloWithOptionalParameter(String key,[String? name='World', int? age]) {
  print('Hello $name');
}
