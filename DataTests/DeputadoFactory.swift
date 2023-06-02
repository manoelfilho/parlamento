import Foundation
import XMLCoder
import Domain

func makeDeputado() -> Deputado {
    let partidoAtual = Partido(id: 1, sigla: "PL", nome: "Partido Livre")
    let gabinete = Gabinete(numero: 1, anexo: 1, telefone: "9999999999")
    let comissao = Comissao(idOrgaoLegislativoCD: 1, siglaComissao: "SG", nomeComissao: "Nome Comissão", condicaoMembro: "Suplente", dataEntrada: "10/10/2000", dataSaida: "10/09/2001")
    let cargoComissoes = CargoComissoes(idOrgaoLegislativoCD: 1, siglaComissao: "SG", nomeComissao: "Nome Comissão", idCargo: 1, nomeCargo: "Nome cargo", dataEntrada: "10/10/2012", dataSaida: "10/10/2012")
    let periodoExercicio = PeriodoExercicio(siglaUFRepresentacao: "SG", situacaoExercicio: "Situacao", dataInicio: "10/10/2020", dataFim: "10/10/2023", idCausaFimExercicio: 1, descricaoCausaFimExercicio: "Descricao", idCadastroParlamentarAnterior: 1)
    let filiacaoPartidaria = FiliacaoPartidaria(idPartidoAnterior: 2, siglaPartidoAnterior: "AN", nomePartidoAnterior: "PT", idPartidoPosterior: 2, siglaPartidoPosterior: "PL", nomePartidoPosterior: "PMDB", dataFiliacaoPartidoPosterior: "10/10/2020")
    let itemHistoricoLider = ItemHistoricoLider(idHistoricoLider: 1, idCargoLideranca: 2, descricaoCargoLideranca: "Descricao", numOrdemCargo: 2, dataDesignacao: "10/10/2020", dataTermino: "10/10/2000", codigoUnidadeLideranca: "P", siglaUnidadeLideranca: "PNM", idBlocoPartido: "PM")
    
    let deputado = Deputado(
        numLegislatura: 1,
        email: "example@example.com",
        nomeProfissao: "Engenheiro",
        dataNascimento: "1990-01-01",
        dataFalecimento: nil,
        ufRepresentacaoAtual: "SP",
        situacaoNaLegislaturaAtual: "Ativo",
        ideCadastro: 123456,
        idParlamentarDeprecated: nil,
        nomeParlamentarAtual: "John Doe",
        nomeCivil: "John Smith",
        sexo: "M",
        codOrcamento: 789,
        condicao: "Titular",
        matricula: 987654,
        idParlamentar: 987654321,
        nome: "John",
        nomeParlamentar: "JDoe",
        urlFoto: "https://example.com/photo.jpg",
        uf: "SP",
        partido: "ABC",
        anexo: 1,
        fone: "1234567890",
        partidoAtual: partidoAtual,
        gabinete: gabinete,
        comissoes: Comissoes(comissao: [comissao, comissao]),
        cargosComissoes: CargosComissoes(cargoComissoes: [cargoComissoes, cargoComissoes]),
        periodosExercicio: PeriodosExercicio(periodoExercicio: [periodoExercicio, periodoExercicio]),
        historicoNomeParlamentar: ["Name One, Name Two"],
        filiacoesPartidarias: FiliacoesPartidarias(filiacaoPartidaria: [filiacaoPartidaria, filiacaoPartidaria]),
        historicoLider: HistoricoLider(itemHistoricoLider: [itemHistoricoLider, itemHistoricoLider])
        
    )
    
    return deputado
}

func makeCollectionDeputados() -> [Deputado] {
    return [makeDeputado()]
}

func makeDeputadoDataXml() -> Data {
    return try! XMLEncoder().encode(makeDeputado())
}
