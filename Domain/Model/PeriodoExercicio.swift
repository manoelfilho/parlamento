import Foundation

public struct PeriodoExercicio {
    
    //MARK: Properties
    let siglaUFRepresentacao: String?
    let situacaoExercicio: String?
    let dataInicio: String?
    let dataFim: String?
    let idCausaFimExercicio: Int?
    let descricaoCausaFimExercicio: String?
    let idCadastroParlamentarAnterior: Int?

    //MARK: Init
    public init(siglaUFRepresentacao: String?, situacaoExercicio: String?, dataInicio: String?, dataFim: String?, idCausaFimExercicio: Int?, descricaoCausaFimExercicio: String?, idCadastroParlamentarAnterior: Int?) {
        self.siglaUFRepresentacao = siglaUFRepresentacao
        self.situacaoExercicio = situacaoExercicio
        self.dataInicio = dataInicio
        self.dataFim = dataFim
        self.idCausaFimExercicio = idCausaFimExercicio
        self.descricaoCausaFimExercicio = descricaoCausaFimExercicio
        self.idCadastroParlamentarAnterior = idCadastroParlamentarAnterior
    }
    
}

