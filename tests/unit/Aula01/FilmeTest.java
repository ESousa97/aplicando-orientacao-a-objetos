package Aula01;

public class FilmeTest {
    private static final double DELTA = 0.0001;

    public static void main(String[] args) {
        deveRetornarMediaZeroSemAvaliacoes();
        deveCalcularMediaCorretamente();
    }

    private static void deveRetornarMediaZeroSemAvaliacoes() {
        Filme filme = new Filme();
        assertEquals(0.0, filme.pegaMedia(), "Media inicial deve ser zero");
    }

    private static void deveCalcularMediaCorretamente() {
        Filme filme = new Filme();
        filme.avalia(7);
        filme.avalia(9);
        assertEquals(8.0, filme.pegaMedia(), "Media deve considerar todas as avaliacoes");
    }

    private static void assertEquals(double expected, double actual, String message) {
        if (Math.abs(expected - actual) > DELTA) {
            throw new AssertionError(message + ". Esperado: " + expected + ", atual: " + actual);
        }
    }
}
