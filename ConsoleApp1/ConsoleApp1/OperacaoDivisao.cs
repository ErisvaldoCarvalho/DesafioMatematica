public class OperacaoDivisao : OperacaoMatematica
{
    public OperacaoDivisao()
    {
        this.Operador = Operador.Divisao;
        this.GerarNumeros();
    }
    public override bool CalcularResultado(int _resposta)
    {
        return RegistrarResposta(this.X / this.Y == _resposta);
    }
}
