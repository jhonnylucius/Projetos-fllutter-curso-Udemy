void main() {
  final professor1 = Professor("Lenísia", MateriasProfessor.fisica);
  final professor2 = Professor("João", MateriasProfessor.programacao);
  final professor3 = Professor("Maria", MateriasProfessor.quimica);
  final professor4 = Professor("Pedro", MateriasProfessor.geografia);
  final professor5 = Professor("Ana", MateriasProfessor.biologia);
  final professor6 = Professor("José", MateriasProfessor.matematica);

  professor1.verificacao(); // Chamando o método verificação
  professor2.verificacao();
  professor3.verificacao();
  professor4.verificacao();
  professor5.verificacao();
  professor6.verificacao();
}

enum MateriasProfessor {
  // Enum
  programacao(5000.00),
  fisica(4000.00),
  quimica(3500.00),
  geografia(3600.00),
  biologia(5000.00),
  matematica(2900.00);

  final double salario; // salario
  const MateriasProfessor(this.salario); // construtor
}

class Professor {
  // constructor
  final String name;
  final MateriasProfessor materia;

  Professor(this.name, this.materia); // construtor

  void verificacao() {
    // método verificacao para imprimir o nome do professor, a matéria que ele leciona e o salário associado a essa matéria.
    print(
        'Professor $name  leciona ${materia.name} e recebe ${materia.salario}');
  }
}

// Neste exemplo, criamos um enum chamado MateriasProfessor que define 
//diferentes matérias e salários associados a cada matéria.
// Cada valor do enum MateriasProfessor tem um salário associado,
// que é definido no construtor do enum.
// Em seguida, criamos uma classe Professor que tem propriedades de nome e matéria.
// O construtor da classe Professor recebe um nome e uma matéria.
// A classe Professor tem um método verificação que imprime o nome do professor,
// a matéria que ele leciona e o salário associado a essa matéria.
// No método main, criamos instâncias da classe Professor com diferentes matérias
// e chamamos o método verificação para cada instância.
// A saída do código mostra o nome do professor, a matéria que ele leciona e 
//o salário associado a essa matéria.
// Isso demonstra como usar enums em Dart para definir um conjunto de valores
// e associar dados a esses valores, tornando o código mais legível e robusto.
// Enums são uma maneira eficaz de representar um conjunto fixo de valores em Dart,
// tornando o código mais legível e robusto.