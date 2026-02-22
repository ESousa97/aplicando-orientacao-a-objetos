package Aula01.Desafio.Atividade3;

public class MusicaTest {
    private static final double DELTA = 0.0001;

    public static void main(String[] args) {
        deveRetornarMediaZeroSemAvaliacoes();
        deveCalcularMediaCorretamente();
    }

    private static void deveRetornarMediaZeroSemAvaliacoes() {
        Musica musica = new Musica();
        assertEquals(0.0, musica.pegaMedia(), "Media inicial deve ser zero");
    }

    private static void deveCalcularMediaCorretamente() {
        Musica musica = new Musica();
        musica.avalia(8.0);
        musica.avalia(6.0);
        musica.avalia(10.0);
        assertEquals(8.0, musica.pegaMedia(), "Media deve considerar todas as avaliacoes");
    }

    private static void assertEquals(double expected, double actual, String message) {
        if (Math.abs(expected - actual) > DELTA) {
            throw new AssertionError(message + ". Esperado: " + expected + ", atual: " + actual);
        }
    }
}
