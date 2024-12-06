// Classe Nil representa um valor vazio ou o fim de uma estrutura de dados.
// Será útil para evitar o uso de null de maneira explícita.
class Nil {
  @override
  String toString() {
    return "Nil{}";
  }
}

// Getter que retorna uma instância de Nil.
// Assim, toda vez que precisar de um Nil, basta chama-lo.
Nil get nil => Nil();
