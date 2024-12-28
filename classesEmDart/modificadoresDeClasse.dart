// Definindo uma classe com modificadores de acesso em Dart

// Modificador 'public' (padrão) - acessível de qualquer lugar
class PublicClass {
  // Propriedade pública
  String publicProperty = 'I am public';

  // Método público
  void publicMethod() {
    print('This is a public method');
  }
}

// Modificador 'private' - acessível apenas dentro da mesma biblioteca
class PrivateClass {
  // Propriedade privada (prefixada com '_')
  String _privateProperty = 'I am private';

  // Método privado (prefixado com '_')
  void _privateMethod() {
    print('This is a private method');
  }

  // Método público que acessa membros privados
  void accessPrivateMembers() {
    print(_privateProperty);
    _privateMethod();
  }
}

// Modificador 'protected' - não existe em Dart, mas pode ser simulado com mixins
mixin ProtectedMixin {
  // Propriedade protegida (prefixada com '_')
  String _protectedProperty = 'I am protected';

  // Método protegido (prefixado com '_')
  void _protectedMethod() {
    print('This is a protected method');
  }
}

class DerivedClass with ProtectedMixin {
  // Classe derivada com mixin protegido
  void accessProtectedMembers() {
    print(_protectedProperty);
    _protectedMethod();
  }
}

// Modificador 'abstract' - classe que não pode ser instanciada diretamente
abstract class AbstractClass {
  // Método abstrato (deve ser implementado por subclasses)
  void abstractMethod();
}

// Classe concreta que implementa a classe abstrata
class ConcreteClass extends AbstractClass {
  @override
  void abstractMethod() {
    print('This is an abstract method implementation');
  }
}

// Modificador 'interface' - não existe em Dart, mas pode ser simulado com classes abstratas
abstract class InterfaceClass {
  void interfaceMethod();
}

// Classe que implementa a interface
class InterfaceImplementation implements InterfaceClass {
  @override
  void interfaceMethod() {
    print('This is an interface method implementation');
  }
}

// Modificador 'base' - classe que pode ser estendida, mas não implementada
base class BaseClass {
  void baseMethod() {
    print('This is a base method');
  }
}

// Classe que estende a classe base
base class DerivedFromBase extends BaseClass {
  @override
  void baseMethod() {
    print('This is an overridden base method');
  }
}

// Modificador 'final' - classe que não pode ser estendida
final class FinalClass {
  void finalMethod() {
    print('This is a final method');
  }
}

// Modificador 'mixin' - usado para adicionar funcionalidades a outras classes
mixin AdditionalMixin {
  void mixinMethod() {
    print('This is a mixin method');
  }
}

// Classe que usa o mixin
class MixedClass with AdditionalMixin {}

// Modificador 'sealed' - classe que só pode ser estendida dentro do mesmo arquivo
sealed class SealedClass {
  void sealedMethod() {
    print('This is a sealed method');
  }
}

// Classe que estende a classe selada
class ExtendedSealedClass extends SealedClass {
  @override
  void sealedMethod() {
    print('This is an overridden sealed method');
  }
}

void main() {
  // Exemplo de uso da classe pública
  var publicClass = PublicClass();
  print(publicClass.publicProperty);
  publicClass.publicMethod();

  // Exemplo de uso da classe privada
  var privateClass = PrivateClass();
  privateClass.accessPrivateMembers();

  // Exemplo de uso da classe derivada com mixin protegido
  var derivedClass = DerivedClass();
  derivedClass.accessProtectedMembers();

  // Exemplo de uso de uma classe abstrata
  var abstractClass = ConcreteClass();
  abstractClass.abstractMethod();

  // Exemplo de uso de uma interface
  var interfaceClass = InterfaceImplementation();
  interfaceClass.interfaceMethod();

  // Exemplo de uso da classe base
  var baseClass = DerivedFromBase();
  baseClass.baseMethod();

  // Exemplo de uso da classe final
  var finalClass = FinalClass();
  finalClass.finalMethod();

  // Exemplo de uso da classe com mixin
  var mixedClass = MixedClass();
  mixedClass.mixinMethod();

  // Exemplo de uso da classe selada
  var sealedClass = ExtendedSealedClass();
  sealedClass.sealedMethod();
}

// explicações
// Modificadores de classe em Dart
// Em Dart, as classes podem ter modificadores de acesso que controlam a
//visibilidade de seus membros e a capacidade de estender ou implementar
// a classe. Os modificadores de classe em Dart incluem:
 // - public: acessível de qualquer lugar.
 // - private: acessível apenas dentro da mesma biblioteca.
 // - protected: não existe em Dart, mas pode ser simulado com mixins.
 // - abstract: classe que não pode ser instanciada diretamente.
 // - interface: não existe em Dart, mas pode ser simulado com classes abstratas.
 // - base: classe que pode ser estendida, mas não implementada.
 // - final: classe que não pode ser estendida.
 // - mixin: usado para adicionar funcionalidades a outras classes.
 // - sealed: classe que só pode ser estendida dentro do mesmo arquivo.

// Exemplos de uso de modificadores de classe em Dart de classes públicas,
// privadas, protegidas, abstratas, de interface, de base, finais, de mixin e seladas.

// A classe PublicClass é uma classe pública com uma propriedade pública e um método público.
// A classe PrivateClass é uma classe privada com uma propriedade privada e um método privado.
// A classe DerivedClass é uma classe derivada com um mixin protegido que simula membros protegidos.
// A classe ConcreteClass é uma classe concreta que implementa uma classe abstrata.
// A classe InterfaceImplementation é uma classe que implementa uma interface simulada.
// A classe DerivedFromBase é uma classe que estende uma classe base.
// A classe FinalClass é uma classe final que não pode ser estendida.
// A classe MixedClass é uma classe que usa um mixin adicional.
// A classe ExtendedSealedClass é uma classe que estende uma classe selada no mesmo arquivo.
// Cada exemplo demonstra o uso de um modificador de classe específico em Dart.
// Você pode experimentar esses exemplos e explorar mais sobre modificadores de classe em Dart.
// Para saber mais sobre modificadores de classe em Dart, consulte a documentação oficial do Dart.
// https://dart.dev/guides/language/language-tour#classes
// https://dart.dev/guides/language/language-tour#abstract-classes
// https://dart.dev/guides/language/language-tour#interfaces
// https://dart.dev/guides/language/language-tour#mixin
// https://dart.dev/guides/language/language-tour#sealing
// https://dart.dev/guides/language/language-tour#extending-a-class
// https://dart.dev/guides/language/language-tour#implementing-an-interface
// https://dart.dev/guides/language/language-tour#overriding-members
// https://dart.dev/guides/language/language-tour#final-classes
// https://dart.dev/guides/language/language-tour#mixin-classes
// https://dart.dev/guides/language/language-tour#sealing
// https://dart.dev/guides/language/language-tour#privacy

