package Aula01.Desafio.Atividade3;

public class metodoMusica {
    public static void main(String[] args) {
        Musica musica = new Musica();

        musica.titulo = "Jesus em Tua Presença";
        musica.artista = "Asaph Borba";
        musica.anoLancamento = 2001;

        musica.exibeFichaTecnica();
        musica.avalia(8.9);
        musica.avalia(6.7);
        musica.avalia(5.4);
        musica.avalia(9.7);

        System.out.println("Média de avaliações de musica: " + musica.pegaMedia());
    }
}
