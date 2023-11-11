public class OperacaoMultiplicacao : OperacaoMatematica
{
    public OperacaoMultiplicacao()
    {
        this.Operador = Operador.Multiplicacao;
        this.GerarNumeros();
    }
    public override bool CalcularResultado(int _resposta)
    {
        return RegistrarResposta(this.X * this.Y == _resposta);
    }
}
