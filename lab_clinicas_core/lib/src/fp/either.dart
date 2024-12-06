// Uma classe selada que só pode ser estendida pelas classes definidas no mesmo arquivo.
// Em programação funcional, o Either é usado para representar dois resultados possíveis no caso desse package será:
// - Left (Para erros ou falhas).
// - Right (Para sucessos ou resultados válidos).
// Essa abordagem evita o uso de valores nulos, forçando a presença de um valor (ou Left ou Right).
sealed class Either<L, R> {}

// Representa o "lado esquerdo" da estrutura Either.
// será usado para representar um erro ou um caso alternativo.
class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value);
}

// Representa o "lado direito" da estrutura Either.
// será usado para representar um sucesso ou o caso principal.
class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value);
}
