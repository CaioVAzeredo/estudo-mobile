void main() {
  List<int> numeros = [1, 2, 3, 4, 5];

  for (int i = 0; i < 5; i++) {
    print("FOR classico: ${numeros[i]}");
  }

  for (int numero in numeros) {
    print("\nFOR EACH: $numero");
  }
}
