using System.Reflection.Metadata.Ecma335;

internal class Program
{
    private static void Main(string[] args)
    {
        JogoMatematica jogoMatematica = new JogoMatematica();
        while (jogoMatematica.Vidas > 0 && jogoMatematica.Estrelas < 5)
        {
            Console.Clear();
            Console.WriteLine($"Moedas: {jogoMatematica.Moedas} Vidas: {jogoMatematica.Vidas} Estrelas: {jogoMatematica.Estrelas}\n\n");
            jogoMatematica.Desafiar();
        }

        if (jogoMatematica.Vidas == 0)
            GameOver();
        else
            VoceECampeao();

    }

    private static void VoceECampeao()
    {
        Console.WriteLine("Você zerou o jogo!!!!!!!!!!!!!!");
        Console.WriteLine("Eu sempre acreditei em você!!!!");
    }

    private static void GameOver()
    {
        Console.WriteLine("Game Over ;(");
    }
}
