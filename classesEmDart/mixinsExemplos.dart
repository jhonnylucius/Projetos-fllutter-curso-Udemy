// Definindo um mixin básico
mixin Caminhar {
  void andar() {
    print("Andando...");
  }
}

// Definindo um mixin mais avançado com estado
mixin Correr {
  int velocidade = 10;

  void correr() {
    print("Correndo a $velocidade km/h");
  }
}

// Definindo um mixin com método abstrato
mixin Nadar {
  void nadar();
}

// Classe base
class Animal {
  void respirar() {
    print("Respirando...");
  }
}

// Classe que usa mixins básicos
class Cachorro extends Animal with Caminhar, Correr {
  void latir() {
    print("Latindo...");
  }
}

// Classe que implementa método abstrato do mixin
class Peixe extends Animal with Nadar {
  @override
  void nadar() {
    print("Nadando...");
  }
}

// Classe que usa múltiplos mixins
class Pato extends Animal with Caminhar, Nadar {
  @override
  void nadar() {
    print("Pato nadando...");
  }

  void grasnar() {
    print("Grasnando...");
  }
}

void main() {
  // Exemplo básico
  var cachorro = Cachorro();
  cachorro.respirar();
  cachorro.andar();
  cachorro.correr();
  cachorro.latir();

  // Exemplo com método abstrato
  var peixe = Peixe();
  peixe.respirar();
  peixe.nadar();

  // Exemplo com múltiplos mixins
  var pato = Pato();
  pato.respirar();
  pato.andar();
  pato.nadar();
  pato.grasnar();
}
// explicações
// Neste exemplo, definimos três mixins diferentes: Caminhar, Correr e Nadar.
// O mixin Caminhar fornece um método andar() que imprime "Andando...".
// O mixin Correr fornece um método correr() que imprime "Correndo a
//$velocidade km/h", onde $velocidade é uma propriedade do mixin.
// O mixin Nadar fornece um método abstrato nadar() que deve
//ser implementado pelas classes que o utilizam.
// Em seguida, definimos uma classe base chamada Animal com um método
//respirar() que imprime "Respirando...".
// A classe Cachorro usa os mixins Caminhar e Correr, além de
//implementar um método latir() que imprime "Latindo...".
// A classe Peixe usa o mixin Nadar e implementa o método abstrato
//nadar() com a implementação "Nadando...".
// A classe Pato usa os mixins Caminhar e Nadar, além de implementar
//um método grasnar() que imprime "Grasnando...".
// Na função main(), criamos instâncias das classes Cachorro, Peixe e
//Pato e chamamos os métodos disponíveis em cada uma delas.
// O resultado será a impressão das mensagens correspondentes a cada
//método, demonstrando como os mixins podem ser usados para adicionar
//comportamentos específicos a diferentes classes.
// Os mixins são uma poderosa ferramenta em Dart que permitem a
//reutilização de código e a composição de comportamentos em classes
//de forma flexível e modular.
// Eles podem ser usados para adicionar funcionalidades específicas a
//classes sem a necessidade de herança múltipla, permitindo uma
//abordagem mais flexível e extensível na definição de comportamentos
//em classes.
// Em resumo, os mixins são uma ferramenta poderosa em Dart que
//permitem a composição de comportamentos em classes de forma
//flexível e modular, promovendo a reutilização de código e a
//manutenção de uma estrutura consistente em um sistema de software.
