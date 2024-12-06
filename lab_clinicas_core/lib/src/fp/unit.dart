// Define a classe Unit que representa a ausência de um valor útil.
// Na programação funcional, é uma alternativa ao void ou null.
final class Unit {
  @override
  String toString() {
    return 'Unit{}';
  }
}

// Getter que retorna uma instância de Unit.
// Assim, toda vez que precisar de um Unit, basta chama-lo.
Unit get unit => Unit();
