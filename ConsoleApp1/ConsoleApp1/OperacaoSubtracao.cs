public class OperacaoSubtracao : OperacaoMatematica
{
    public OperacaoSubtracao()
    {
        this.Operador = Operador.Subtracao;
        this.GerarNumeros();
    }
    public override bool CalcularResultado(int _resposta)
    {
        return RegistrarResposta(this.X - this.Y == _resposta);
    }
}
