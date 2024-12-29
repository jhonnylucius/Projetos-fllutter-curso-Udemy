// Classe Pessoa representa uma pessoa com nome e idade
class Pessoa {
  String nome;
  int idade;

  // Construtor da classe Pessoa
  Pessoa(this.nome, this.idade);

  // Método para exibir informações da pessoa
  void exibirInfo() {
    print('Nome: $nome, Idade: $idade');
  }
}

// Classe Aluno que herda de Pessoa e adiciona a propriedade matricula
class Aluno extends Pessoa {
  String matricula;

  // Construtor da classe Aluno
  Aluno(String nome, int idade, this.matricula) : super(nome, idade);

  // Sobrescreve o método exibirInfo para incluir a matrícula
  @override
  void exibirInfo() {
    print('Nome: $nome, Idade: $idade, Matrícula: $matricula');
  }
}

// Classe Professor que herda de Pessoa e adiciona a propriedade disciplina
class Professor extends Pessoa {
  String disciplina;

  // Construtor da classe Professor
  Professor(String nome, int idade, this.disciplina) : super(nome, idade);

  // Sobrescreve o método exibirInfo para incluir a disciplina
  @override
  void exibirInfo() {
    print('Nome: $nome, Idade: $idade, Disciplina: $disciplina');
  }
}

void main() {
  // Cria uma instância de Pessoa
  Pessoa pessoa = Pessoa('João', 30);
  pessoa.exibirInfo();

  // Cria uma instância de Aluno
  Aluno aluno = Aluno('Maria', 20, '2021001');
  aluno.exibirInfo();

  // Cria uma instância de Professor
  Professor professor = Professor('Carlos', 40, 'Matemática');
  professor.exibirInfo();
}

// explicações
// A classe Pessoa é uma classe base que representa uma pessoa com nome e idade.
// A classe Aluno herda da classe Pessoa e adiciona a propriedade matrícula.
// A classe Professor também herda da classe Pessoa e adiciona a propriedade disciplina.
// Ambas as subclasses Aluno e Professor têm um construtor que chama o construtor da classe base Pessoa usando super().
// As subclasses Aluno e Professor sobrescrevem o método exibirInfo() para incluir informações específicas de cada classe.
// Na função main(), criamos instâncias de Pessoa, Aluno e Professor e chamamos o método exibirInfo() em cada uma delas.
// A saída do programa será:
// Nome: João, Idade: 30
// Nome: Maria, Idade: 20, Matrícula: 2021001
// Nome: Carlos, Idade: 40, Disciplina: Matemática
// Isso demonstra como a herança pode ser usada para reutilizar código e adicionar funcionalidades específicas em subclasses.
// As subclasses Aluno e Professor herdam as propriedades e métodos da classe Pessoa e adicionam suas próprias propriedades e métodos.
// Ao chamar o método exibirInfo() em cada instância, obtemos as informações específicas de cada classe.
// Isso ilustra como a herança pode ser usada para criar uma hierarquia de classes com funcionalidades compartilhadas e específicas.
// A herança é uma das principais características da programação orientada a objetos e permite a reutilização de código e a organização de classes em uma hierarquia.
// A herança também permite a criação de classes mais especializadas que herdam comportamentos e propriedades de classes mais genéricas.
// Isso ajuda a promover a reutilização de código e a manutenção de uma estrutura consistente em um sistema de software.
// A herança é uma ferramenta poderosa na programação orientada a objetos e deve ser usada com cuidado para garantir uma hierarquia de classes clara e coesa.
// Em resumo, a herança é uma técnica fundamental na programação orientada a objetos que permite a criação de classes com funcionalidades compartilhadas e específicas.
// Ela promove a reutilização de código, a organização de classes em hierarquias e a criação de classes mais especializadas a partir de classes mais genéricas.
// A herança é uma das características mais importantes da programação orientada a objetos e deve ser usada com cuidado para garantir uma estrutura de classes clara e coesa.
