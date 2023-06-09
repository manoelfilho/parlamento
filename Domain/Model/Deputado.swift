import Foundation

public struct Deputado: Model {
    
    //MARK: Deputado Properties
    let numLegislatura: Int?
    let email: String?
    let nomeProfissao: String?
    let dataNascimento: String?
    let dataFalecimento: String?
    let ufRepresentacaoAtual: String?
    let situacaoNaLegislaturaAtual: String?
    let ideCadastro: Int?
    let idParlamentarDeprecated: Int?
    let nomeParlamentarAtual: String?
    let nomeCivil: String?
    let sexo: String?
    let codOrcamento: Int?
    let condicao: String?
    let matricula: Int?
    let idParlamentar: Int?
    let nome: String?
    let nomeParlamentar: String?
    let urlFoto: String?
    let uf: String?
    let partido: String?
    let anexo: Int?
    let fone: String?
    
    let partidoAtual: Partido?
    let gabinete: Gabinete?
    let comissoes: Comissoes
    let cargosComissoes: CargosComissoes
    let periodosExercicio: PeriodosExercicio
    let historicoNomeParlamentar: [String]
    let filiacoesPartidarias: FiliacoesPartidarias
    let historicoLider: HistoricoLider
    
    
    //MARK: Deputado Initializer
    public init(numLegislatura: Int?, email: String?, nomeProfissao: String?, dataNascimento: String?, dataFalecimento: String?, ufRepresentacaoAtual: String?, situacaoNaLegislaturaAtual: String?, ideCadastro: Int?, idParlamentarDeprecated: Int?, nomeParlamentarAtual: String?, nomeCivil: String?, sexo: String?, codOrcamento: Int?, condicao: String?, matricula: Int?, idParlamentar: Int?, nome: String?, nomeParlamentar: String?, urlFoto: String?, uf: String?, partido: String?, anexo: Int?, fone: String?, partidoAtual: Partido?, gabinete: Gabinete?, comissoes: Comissoes, cargosComissoes: CargosComissoes, periodosExercicio: PeriodosExercicio, historicoNomeParlamentar: [String], filiacoesPartidarias: FiliacoesPartidarias, historicoLider: HistoricoLider) {
        self.numLegislatura = numLegislatura
        self.email = email
        self.nomeProfissao = nomeProfissao
        self.dataNascimento = dataNascimento
        self.dataFalecimento = dataFalecimento
        self.ufRepresentacaoAtual = ufRepresentacaoAtual
        self.situacaoNaLegislaturaAtual = situacaoNaLegislaturaAtual
        self.ideCadastro = ideCadastro
        self.idParlamentarDeprecated = idParlamentarDeprecated
        self.nomeParlamentarAtual = nomeParlamentarAtual
        self.nomeCivil = nomeCivil
        self.sexo = sexo
        self.codOrcamento = codOrcamento
        self.condicao = condicao
        self.matricula = matricula
        self.idParlamentar = idParlamentar
        self.nome = nome
        self.nomeParlamentar = nomeParlamentar
        self.urlFoto = urlFoto
        self.uf = uf
        self.partido = partido
        self.anexo = anexo
        self.fone = fone
        self.partidoAtual = partidoAtual
        self.gabinete = gabinete
        self.comissoes = comissoes
        self.cargosComissoes = cargosComissoes
        self.periodosExercicio = periodosExercicio
        self.historicoNomeParlamentar = historicoNomeParlamentar
        self.filiacoesPartidarias = filiacoesPartidarias
        self.historicoLider = historicoLider
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case numLegislatura
        case email
        case nomeProfissao
        case dataNascimento
        case dataFalecimento
        case ufRepresentacaoAtual
        case situacaoNaLegislaturaAtual
        case ideCadastro
        case idParlamentarDeprecated
        case nomeParlamentarAtual
        case nomeCivil
        case sexo
        case codOrcamento
        case condicao
        case matricula
        case idParlamentar
        case nome
        case nomeParlamentar
        case urlFoto
        case uf
        case partido
        case anexo
        case fone
        case partidoAtual
        case gabinete
        case comissoes
        case cargosComissoes
        case periodosExercicio
        case historicoNomeParlamentar
        case filiacoesPartidarias
        case historicoLider
    }
    
}

public struct Deputados: Model {
    let deputado: [Deputado]
    public init(deputado: [Deputado]) {
        self.deputado = deputado
    }
    private enum CodingKeys: String, CodingKey {
        case deputado
    }
    public func getDeputados()->[Deputado]{
        return self.deputado
    }
}

public struct Comissoes: Model {
    let comissao: [Comissao]
    public init(comissao: [Comissao]) {
        self.comissao = comissao
    }
    private enum CodingKeys: String, CodingKey {
        case comissao
    }
}

public struct CargosComissoes: Model {
    let cargoComissoes: [CargoComissoes]
    public init(cargoComissoes: [CargoComissoes]) {
        self.cargoComissoes = cargoComissoes
    }
    private enum CodingKeys: String, CodingKey {
        case cargoComissoes
    }
}

public struct PeriodosExercicio: Model {
    let periodoExercicio: [PeriodoExercicio]
    public init(periodoExercicio: [PeriodoExercicio]) {
        self.periodoExercicio = periodoExercicio
    }
    private enum CodingKeys: String, CodingKey {
        case periodoExercicio
    }
}

public struct FiliacoesPartidarias: Model {
    let filiacaoPartidaria: [FiliacaoPartidaria]
    public init(filiacaoPartidaria: [FiliacaoPartidaria]) {
        self.filiacaoPartidaria = filiacaoPartidaria
    }
    private enum CodingKeys: String, CodingKey {
        case filiacaoPartidaria
    }
}

public struct HistoricoLider: Model {
    let itemHistoricoLider: [ItemHistoricoLider]
    public init(itemHistoricoLider: [ItemHistoricoLider]) {
        self.itemHistoricoLider = itemHistoricoLider
    }
    private enum CodingKeys: String, CodingKey {
        case itemHistoricoLider
    }
}


