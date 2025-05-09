// enumsExemplos.dart

// Definindo um enum básico
enum Status { pending, approved, rejected }

// Usando o enum básico
void main() {
  Status status = Status.pending;

  switch (status) {
    case Status.pending:
      print('Status is pending');
      break;
    case Status.approved:
      print('Status is approved');
      break;
    case Status.rejected:
      print('Status is rejected');
      break;
  }
}

// Definindo um enum com valores associados
enum Color {
  red(0xFF0000),
  green(0x00FF00),
  blue(0x0000FF);

  final int value;
  const Color(this.value);
}

// Usando o enum com valores associados
void mainColor() {
  Color color = Color.red;
  print('Color value: ${color.value}');
}

// Definindo um enum com métodos
enum Direction {
  north,
  south,
  east,
  west;

  String get description {
    switch (this) {
      case Direction.north:
        return 'Up';
      case Direction.south:
        return 'Down';
      case Direction.east:
        return 'Right';
      case Direction.west:
        return 'Left';
    }
  }
}

// Usando o enum com métodos
void mainDirection() {
  Direction direction = Direction.north;
  print('Direction: ${direction.description}');
}

// Definindo um enum com herança (implementando uma interface)
abstract class Describable {
  String get description;
}

enum VehicleType implements Describable {
  car,
  bike,
  bus;

  @override
  String get description {
    switch (this) {
      case VehicleType.car:
        return 'Four-wheeled motor vehicle';
      case VehicleType.bike:
        return 'Two-wheeled motor vehicle';
      case VehicleType.bus:
        return 'Large motor vehicle for transporting passengers';
    }
  }
}

// Usando o enum com herança
void mainVehicle() {
  VehicleType vehicle = VehicleType.car;
  print('Vehicle: ${vehicle.description}');
}

void mainVehicleExample() {
  VehicleType vehicle = VehicleType.car;
  print('Vehicle: ${vehicle.description}');
}

// Neste exemplo, definimos vários enums em Dart com diferentes funcionalidades:
// - Um enum básico com valores simples.
// - Um enum com valores associados (como códigos de cores).
// - Um enum com métodos para retornar descrições personalizadas.
// - Um enum que implementa uma interface (herança).
// Cada enum demonstra uma técnica diferente para usar enums em Dart e pode ser 
// útil em diferentes situações de programação.
// Enums são uma maneira eficaz de representar um conjunto fixo de valores em Dart,
// tornando o código mais legível e robusto.

