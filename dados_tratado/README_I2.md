# Limpeza da Base de Dados

## Limpeza Primária

- Remoção de espaços duplos (TRIM)
- Remoção de espaços no final das células (TRIM)
- Padronizar dados numéricos (tirar pontuação e vírgulas)
- Converter dados numéricos gravados como texto ("01" para 1)
- Transcrição de texto para número ("nove" para 9)

## Padronização de Colunas

| Coluna Original | Coluna Renomeada |
| :----- | :----- |
| Carimbo de data/hora | Carimbo |
| 1.1- Data de preenchimento | Data |
| Nome completo | Usuário_Nome |
| E-mail | Usuário_Email |
| Telefone para contato | Usuário_Telefone |
| 1.3- Participou da Oficina de Formação realizada pela equipe de Pesquisa do CENSO? | Participou_Oficina |
| 1.3.1- Caso não, qual o motivo? | MotivoParticipouOficina |
| 1.4- Ocupação *Refere-se à ocupação no equipamento no momento atual, não à sua profissão | Ocupação_MomentoAtual |
| 1.5- Cargo/Função *Preencha essa questão caso alguma das pessoas que estejam preenchendo esse formulário esteja em cargo de gestão. Se não for o caso, preencha com “Não se aplica” | Cargo/Função |
| 1.6- Nome completo da unidade/equipamento da RAPS *Refere-se ao nome completo de sua unidade, como por exemplo, Caps ad III Miriam Makeba ou Caps II Neusa Santos | NomeCompleto_Unidade |
| 1.7- Região em que se localiza | Região_Localidade |
| 1.8- Município | Município |
| 1.9- Bairro | Bairro |
| 1.10- Informe o tipo de unidade/equipamento da RAPS a que este questionário se refere | TipoNome_Unidade |
| 1.11- Esse equipamento possui Residência Terapêutica? | Possui_RT |
| Se sim, quantas? *Informar o número (ex: 4) | Quantidade_RT |
| 1.12- Esse equipamento possui Unidade de Acolhimento Adulto? | Possui_UAA |
| Se sim, quantas? *Informar o número (ex: 4) | Quantidade_UAA |
| 1.13- Esse equipamento possui Unidade de Acolhimento Infanto Juvenil? | Possuiu_UAI |
| Se sim, quantas? *Informar o número (ex: 4) | Quantidade_UAI |
| 1.14- Esse equipamento possui ações de geração de renda e/ou economia solidária? | Equipamento_GR |
| Se sim, quantas? *Informar o número (ex: 4) | Quantidade_GR |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Sofrimento psíquico leve] | Demanda_SofrimentoLeve |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Sofrimento psíquico grave e persistente] | Demanda_SofrimentoGrave |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Crise] | Demanda_Crise |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Uso prejudicial de álcool e/ou outras drogas] | Demanda_AlcoolDrogas |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Transtornos cognitivos/do aprendizado] | Demanda_TranstornoAprendizado |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Auto mutilação] | Demanda_Mutilação |
| 2.1- Quais as principais demandas/motivos que trazem o(a) usuário/usuária a esta unidade/equipamento da RAPS? Enumere os três principais motivos por grau de importância. *Por exemplo: A demanda que mais chega no equipamento vai ser numerada com o grau 1, a segunda que mais aparece com o grau 2 e a terceira com o grau 3. [Tentativa ou ideação suicida] | Demanda_Suicídio |
| 2.2- Qual o número total de usuários/usuárias matriculados(as) em busca ativa no serviço até o momento? *Usuários/Usuárias em busca ativa refere-se aqueles que não realizaram nenhum procedimento no período de 1 mês. *Informar o número (ex: 1.230) | Quantidade_BuscaAtiva |
| 2.3- Qual o número total de usuários/usuárias matriculados(as) no serviço nos últimos 5 anos? *Refere-se ao número total de usuários registrados nos últimos 5 anos,  Informar o número (ex: 3.240). Caso seu equipamento não tenha todo esse tempo de existência, sinalizar qual o ano que se inicia a contagem dos dados. Por exemplo: “3.240 usuários desde 2020” | Quantidade_5Anos |
| 2.4- Qual o número total de usuários/usuárias matriculados(as) em acompanhamento entre janeiro de 2022 e dezembro de 2023 no serviço? *No período proposto, preencher o total de usuários atendidos, sejam aqueles que se matricularam neste período ou aqueles que continuaram sendo acompanhados neste período - mesmo que tenham sido matriculados em anos anteriores. Informar o número (ex: 3.240) | Quantidade_22/23 |
| Mulher cis | Gênero_MulherCis |
| Homem cis | Gênero_HomemCis |
| Mulher trans | Gênero_MulherTrans |
| Homem trans | Gênero_HomemTrans |
| Travesti | Gênero_Travesti |
| Não binário | Gênero_NãoBinário |
| Outro | Gênero_Outro |
| Não tem informação | Gênero_SI |
| Branca | Raça_Branca |
| Parda | Raça_Parda |
| Preta | Raça_Preta |
| Indígena | Raça_Indígena |
| Amarela | Raça_Amarela |
| Não tem informação | Raça_SI |
| Heterossexual | Orientação_Heterossexual |
| Homossexual | Orientação_Homossexual |
| Bissexual | Orientação_Bissexual |
| Pansexual | Orientação_Pansexual |
| Outra | Orientação_Outra |
| Não tem informação | Orientação_SI |
| Número total de usuários/usuárias com deficiência: | PCD |
| Visual *Deficiência visual refere- se a perda total (cegueira) ou parcial (baixa visão) da capacidade visual de um ou dos dois olhos. | PCD_DV |
| Auditiva *Deficiência auditiva refere-se a perda bilateral, parcial ou total da capacidade auditiva. | PCD_Auditiva |
| Motora *Deficiência motora refere-se a alterações completas ou parciais de um ou mais segmentos do corpo humano, que acarretam o comprometimento da mobilidade e da coordenação geral. | PCD_Motora |
| Cognitiva ou Intelectual *Deficiência mental ou intelectual refere-se a habilidades intelectuais reduzidas e restrições relacionadas a duas ou mais áreas de habilidades adaptativas (comunicação; cuidado pessoal; habilidades sociais; utilização dos recursos da comunidade;  saúde e segurança; habilidades acadêmicas; lazer e trabalho). | PCD_Cognitiva |
| Não tem informação *Caso essa informação não tenha sido perguntada ou se a pessoa não quis se identificar neste aspecto. | PCD_SI |
| Outra *Existem outras deficiências que não foram listadas. Caso a pessoa responda algo diferente das opções, escrever neste campo. | PCD_Outra |
| 2.7- Número total de usuários/usuárias de outra nacionalidade: *Informar o número (ex: 30) | Estrangeiro |
| 2.7.1- Do total de usuários/usuárias de outra nacionalidade, quantos são refugiados(as)? *Refugiados são pessoas que estão fora de seu país de origem devido a razões fundamentadas de perseguição relacionadas a questões de raça, religião, nacionalidade, afiliação a um grupo social específico ou opinião política, bem como devido a violações graves e generalizadas dos direitos humanos e conflitos armados. Informar o número (ex: 30) | Estrangeiro_Refugiado |
| Mulher cis | EstrangeiroGênero_MulherCis |
| Homem cis | EstrangeiroGênero_HomemCis |
| Mulher trans | EstrangeiroGênero_MulherTrans |
| Homem trans | EstrangeiroGênero_HomemTrans |
| Outros | EstrangeiroGênero_Outros |
| Não tem informação | EstrangeiroGênero_SI |
| Branca | EstrangeiroRaça_Branca |
| Parda | EstrangeiroRaça_Parda |
| Preta | EstrangeiroRaça_Preta |
| Indígena | EstrangeiroRaça_Indígena |
| Amarela | EstrangeiroRaça_Amarela |
| Não tem informação | EstrangeiroRaça_SI |
| Heterossexual | EstrangeiroOrientação_Heterossexual |
| Homossexual | EstrangeiroOrientação_Homossexual |
| Bissexual | EstrangeiroOrientação_Bissexual |
| Pansexual | EstrangeiroOrientação_Pansexual |
| Outra | EstrangeiroOrientação_Outra |
| Não tem informação | EstrangeiroOrientação_SI |
| Sem religião | Religião_Nenhuma |
| Católica | Religião_Católica |
| Evangélica/ Protestante | Religião_Protestante |
| Espírita | Religião_Espírita |
| Candomblecista | Religião_Candomblecista |
| Umbandista | Religião_Umbandista |
| Outra | Religião_Outra |
| Não tem informação | Religião_SI |
| 0 a 11 anos | Idade_00/11 |
| 12 a 17 anos | Idade_12/17 |
| 18 a 29 anos | Idade_18/29 |
| 30 a 39 anos | Idade_30/39 |
| 40 a 49 anos | Idade_40/49 |
| 50 a 59 anos | Idade_50/59 |
| 60 ou + 61 anos | Idade_60 |
| Não tem informação | Idade_SI |
| Iletrado | Formação_Iletrado |
| Ensino fundamental incompleto | Formação_IncompletoFundamental |
| Ensino fundamental completo | Formação_CompletoFundamental |
| Ensino médio incompleto | Formação_IncompletoMédio |
| Ensino médio completo | Formação_CompletoMédio |
| Ensino superior incompleto | Formação_IncompletoSuperior |
| Ensino superior completo | Formação_CompletoSuperior |
| Pós graduação incompleta | Formação_IncompletoPós |
| Pós graduação completa | Formação_CompletoPós |
| Não tem informação | Formação_SI |
| Trabalho com carteira assinada | Labore_CLT |
| Militares | Labore_Militar |
| Servidores públicos estatutários | Labore_Estatutário |
| Trabalho sem carteira assinada | Labore_Informal |
| Trabalha por conta própria | Labore_Autônomo |
| Geração de renda/ economia solidária | Labore_GeraçãoRenda |
| Desempregado | Labore_Desempregado |
| Outro | Labore_Outro |
| Não tem informação | Labore_SI |
| Bolsa família | Beneficiário_BolsaFamília |
| Benefício de Prestação Continuada (BPC/LOAS) | Beneficiário_BPC |
| Pensão  | Beneficiário_Pensão |
| Aposentadoria  | Beneficiário_Aposentadoria |
| Programa de Volta para Casa  | Beneficiário_VoltaPCasa |
| Gratuidade de transporte público  | Beneficiário_PasseLivre |
| Outros  | Beneficiário_Outros |
| Não sei informar  | Beneficiário_SI |
| Até meio salário mínimo *Entre R$ 0 e R$ 706,00 | Renda_000/706 |
| Acima de meio até um salário mínimo  *Entre R$ 707,00 e R$ 1.412,00 | Renda_707/1412 |
| De um até dois salários mínimos *Entre R$ 1.413,00 e R$ 2.824,00 | Renda_1413/2824 |
| Acima de dois até três salários mínimos *Entre R$ 2.825,00 e R$ 4.236,00 | Renda_2825/4236 |
| Acima de três salários mínimos *Acima de  R$ 4.236,00 | Renda_4236 |
| Não possuem renda | Renda_Nenhuma |
| Não tem informação | Renda_SI |
| Regiões/Distrito centrais *Bairros caracterizados por concentrarem um grande número de comércio, serviços, equipamentos públicos e circulação de pessoas. Não confundir com as regiões comerciais no interior dos bairros. Nos referimos aos bairros centrais em relação ao município. | Região_Central |
| Regiões/Distrito periféricas *Bairros um pouco mais afastados do centro da cidade, em que normalmente residem trabalhadores das classes média e baixa. | Região_Periferia |
| Favela/comunidade *Área de povoamento, formada por moradias populares, onde predominam pessoas socialmente pobres. No interior dos bairros podem existir favelas ou estas podem chegar a serem reconhecidas enquanto um bairro. Em ambos os casos, é importante enumerar a quantidade de usuários moradores destas regiões. | Região_Comunidade |
| Campo/área rural *É uma região não urbanizada, destinada a atividades da agricultura e pecuária, extrativismo, turismo rural, silvicultura ou conservação ambiental | Região_Rural |
| Comunidade quilombola *Grupos étnicos que possuem uma mesma relação com o território, origem, cultura e parentesco. Suas tradições estão ligadas a movimentos de resistência de populações negras e indígenas a sistemas de dominação coloniais. No interior dos bairros podem existir comunidades quilombolas ou estas podem chegar a serem reconhecidas enquanto um bairro. Em ambos os casos, é importante enumerar a quantidade de usuários moradores destas regiões. | Região_Quilombo |
| Território indígena *São territórios habitados por pessoas descendentes dos diversos povos originários do Brasil. No interior dos bairros podem existir territórios indígenas ou estas podem chegar a serem reconhecidas enquanto um bairro. Em ambos os casos, é importante enumerar a quantidade de usuários moradores destas regiões. | Região_Indígena |
| Território Ribeirinho *Áreas geográficas adjacentes a corpos d'água, como rios, lagos, lagoas ou outros cursos de água. | Região_Ribeirinho |
| Não tem informação | Região_SI |
| Domiciliados | Moradia_Domiciliados |
| Em situação de rua | Moradia_SitRua |
| Em abrigo | Moradia_Abrigo |
| Em Comunidade Terapêutica | Moradia_CT |
| Ocupação | Moradia_Ocupação |
| Serviço de Residência Terapêutica | Moradia_SRT |
| Unidade de Acolhimento Adulto | Moradia_UAA |
| Unidade de Acolhimento Infantil | Moradia_UAI |
| Não tem informação | Moradia_SI |
| F19 - Transtornos mentais e comportamentais devidos ao uso de múltiplas drogas e ao uso de outras substâncias psicoativas | CID_F19 |
| F20 - Esquizofrenia (distorções do pensamento e da percepção) | CID_F20 |
| F21 - Transtorno esquizotípico | CID_F21 |
| F22 - Transtornos delirantes persistentes | CID_F22 |
| F23 - Transtornos psicóticos agudos e transitórios | CID_F23 |
| F25 - Transtorno esquizoafetivo tipo depressivo | CID_F25 |
| F28 - Outros transtornos psicóticos não-orgânicos | CID_F28 |
| F29 - Psicose sem outra especificação (SOE) | CID_F29 |
| F30 - Hipomania | CID_F30 |
| F31 - Transtorno afetivo bipolar | CID_F31 |
| F32 - Episódios depressivos | CID_F32 |
| F33 - Transtorno depressivo recorrente | CID_F33 |
| F34 - Transtornos de humor [afetivos] persistentes | CID_F34 |
| F38 - Outros transtornos do humor [afetivos] | CID_F38 |
| F39 - Transtorno do humor [afetivo] não especificado | CID_F39 |
| F40 - Transtornos fóbico-ansiosos | CID_F40 |
| F41 - Transtorno de pânico | CID_F41 |
| F42 - Transtorno obsessivo-compulsivo | CID_F42 |
| F43 - Reações ao "stress" grave e transtornos de adaptação | CID_F43 |
| F44 - Amnésia dissociativa | CID_F44 |
| F45 - Transtornos somatoformes | CID_F45 |
| F48 - Outros transtornos neuróticos | CID_F48 |
| F50 -  Transtornos da alimentação | CID_F50 |
| F51 - Transtornos não-orgânicos do sono devidos a fatores emocionais | CID_F51 |
| F59 - Síndromes comportamentais associados a transtornos das funções fisiológicas e a fatores físicos, não especificadas | CID_F59 |
| F70 - Retardo Mental Leve | CID_F70 |
| F71 - Retardo Mental Moderado | CID_F71 |
| F72 - Retardo mental grave | CID_F72 |
| F78 - Outro retardo mental | CID_F78 |
| F79 - Retardo mental não especificado | CID_F79 |
| F80 - Transtornos específicos do desenvolvimento da fala e da linguagem | CID_F80 |
| F81 - Transtornos específicos do desenvolvimento das habilidades escolares | CID_F81 |
| F82 - Transtorno específico do desenvolvimento motor | CID_F82 |
| F83 - Transtornos específicos misto do desenvolvimento | CID_F83 |
| F84 - Transtornos globais do desenvolvimento | CID_F84 |
| F88 - Outros transtornos do desenvolvimento psicológico | CID_F88 |
| F89 - Transtorno do desenvolvimento psicológico não especificado | CID_F89 |
| F90 - Distúrbios da atividade e da atenção (TDAH) | CID_F90 |
| F91 - Distúrbios de conduta | CID_F91 |
| F92 - Transtornos mistos de conduta e das emoções | CID_F92 |
| F93 - Transtornos emocionais com início especificamente na infância | CID_F93 |
| F94 - Transtornos do funcionamento social com início especificamente durante a infância ou a adolescência | CID_F94 |
| F95 - Tiques | CID_F95 |
| F98 - Outros transtornos comportamentais e emocionais com início habitualmente durante a infância ou a adolescência | CID_F98 |
| F99 - Transtorno mental não especificado | CID_F99 |
| 2.17- Quantas prescrições de psicotrópicos foram emitidas de janeiro de 2022  a dezembro de 2023? *Informar o número (ex: 30) | PrescriçãoPsicotrópico22/23 |
| 2.18- Quais as cinco medicações mais prescritas neste período?  | MedicaçõesMaisPrescritas |
| 3.1.1- Equipamentos do SUS Marque as três principais: | Demanda_EquipamenteSUS |
| 3.1.2- Equipamentos do SUAS Marque as três principais: | Demanda_EquipamentoSUAS |
| 3.1.3- Outras unidades/equipamentos Marque as três principais: | Demanda_Outros |
| 3.2- As questões sociais, como desemprego, violência territorial entre outras, são motivos que trazem o(a) usuário/usuária a procurarem o serviço? *Quando nos referimos a questões sociais, estamos entendendo as contradições próprias da sociedade capitalista, como a pobreza, desemprego, violência, fome e as desigualdades sociais de forma geral. | BuscaServiço_Social |
| 3.3- Devido a crise sanitária da pandemia de COVID-19, foi registrado um maior número de usuários/usuárias para atendimento de primeira vez? | AumentoUsuários_COVID |
| 3.4- Durante atendimento, oficinas e atividades com os(as) usuários/usuárias, são relatados danos para a vida após a COVID 19? | DanosVida_COVID |
| 3.4.1- Caso sim, quais desses motivos mais apareceram? | QuaisDanosVida |
| 3.5- No território em que esta unidade/equipamento atua/está situado existe um trabalho de articulação intersetorial (entre ONGs/OSCs, SUS e SUAS)? | ArticulaçãoIntersetorial |
| 3.6- Quais as redes de apoio que os(as) usuários/usuárias relatam ter no  território? Marque as três principais: | TrêsRedesApoio |
| 3.7- Aponte três principais motivos que dificultam o acesso dos(as) usuários/usuárias aos serviços de saúde mental. Marque as três principais: | TrêsServiçosDificuldadeSaúdeMental |
| 4.1- Os usuários/usuárias relatam algum risco de sofrerem violência no  território em que residem? *Exemplo: Durante o período de convivência do(a) usuário(a) nos equipamentos da Raps, relatam seja por conversas, atendimento ou mesmo reclamação para a instituição riscos que sofrem em seu território. | UsuárioRelataViolência |
| 4.1.1- Caso sim, que tipo de violência usuários/usuárias mais relatam sofrer? *Pode ser marcada mais de uma resposta | QualViolência |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Familiar] | Violência_Familiar |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Companheiro(a)] | Violência_Companheiro |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Ex-companheiro(a)] | Violência_Ex |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Vizinhos] | Violência_Vizinho |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Agente de Segurança Pública] | Violência_Policial |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Integrante de grupos civis armados (tráfico ou milícia)] | Violência_Milícia |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Servidores públicos/outros trabalhadores] | Violência_ServidorPúblico |
| 4.1.2- Quem é o principal autor ou quais os principais autores dessas violências?  *coloque por ordem de frequência, assinalando o 1 para o pouco frequente e o 8 para o muito frequente [Outros] | Violência_Outros |
| 4.2- Quantos(as) usuários/usuárias com registro ativo (período de janeiro de  2022 a dezembro de 2023) já relataram situação de violência? *Exemplo: Ao verificar no registro da instituição o quantitativo que obtém no período de janeiro de 2022 a dezembro de 2023, Informar o número (ex: 30 ou mesmo zero, caso não tenha o registro). | Usuário2023Violência |
| 4.3- Quantas notificações foram registradas no Sistema de Informações de  Agravos de Notificações (SINAN)? Durante o período de janeiro de 2022 a dezembro de 2023. *Exemplo: Ao verificar no registro da instituição o quantitativo que obteve no período de janeiro de 2022 a dezembro de 2023, Informar o número (ex: 30) | Denuncia2023SINAN |
| 4.4- Os usuários/usuárias já relataram precisar sair do território em que residem pelo risco de sofrer violência?  *Exemplo: Durante o período de convivência do(a) usuário(a) nos equipamentos da Raps, relatam seja por conversas, atendimento ou mesmo reclamação para a instituição o motivo pelo qual não pode residir em seu território. | SairTerritórioViolência |
| 4.4.1- Caso sim. Por qual motivo?   *Exemplo: Nesta pergunta pode ser que algumas das opções sejam o motivo do(a) usuário(a) precisar sair do território ou possa ser que o profissional que lhe acompanha não tenha esta informação. Responda conforme as opções. | QualMotivoViolência |
| 4.5- A violência armada (operações policiais e confrontos entre grupos  armados) já impactou de alguma forma o funcionamento do serviço? | ImpactoViolênciaArmada |
| 4.5.1- Caso sim. No período de janeiro de 2022 a dezembro 2023 quantos dias a Instituição ficou fechada ou teve os serviços interrompidos? *Exemplo: Ao verificar no registro da instituição o quantitativo que obtém no período de janeiro de 2022 a dezembro de 2023, Informar o número (ex: 30 ou mesmo zero, caso não tenha o registro). | DiasFechadosViolênciaArmada |
| 4.6- Existe alguma iniciativa da RAPS com os demais serviços de saúde e/ou  outras instituições do território para atendimento de familiares e vítimas de  violência armada?  *Exemplo: Existe a articulação da Raps com os serviços de saúde do território, com as ongs do território e que desta forma realizam o acompanhamento do usuário(a). | IniciativoRAPSVítimaViolênciaArmada |
| 4.6.1- Caso sim, quais são as iniciativas?   *Exemplo: Nos diga em referência ao território que trabalha, quais as iniciativas, quais as instituições. O Caps que abrange as áreas Y, W e Z realiza articulação com clínicas da família, centro pop e ongs da área W, local que ocorre um dispositivo de ações integradas voltadas para o atendimento da população. | QualIniciativaRAPS |
| 5.1- Esta pesquisa tem relevância para a atuação de profissionais,  usuários/usuárias e demais sujeitos envolvidos no campo da saúde? | ConsideraçãoRelevânciaPesquisa |
| 5.2- Qual(is) fonte(s) de informação foi utilizada para o preenchimento dos dados solicitados neste questionário?  | FonteDadosObtidos |
| 5.3- As informações quanto ao perfil dos usuários do serviço foram coletadas a partir de:  | InformaçãoPerfilUsuário |
| 5.4- Considerando que esse é o primeiro censo psicossocial, caberia  questionar se consideram que faltou alguma pergunta? Para que possa ser  acrescentado posteriormente nos outros Estados.  | FaltouPerguntaCenso? |
| Observações:  | Observações:  |

## Limpeza Final

Existiam perguntas de quantidade de algo e não eram respondidas com número de fato. Muitas vezes recebemos as respostas na forma:

```
Não temos esses dados
Não coletamos esses dados
Não tem
Sem dados
Sem informação
```

Para poder quantizar estes dados, fiz a seguinte mudança:

| Parâmetro | Retorno |
| :--------- | :--------- |
| Dados que pareciam não ter sido coletados | -1 |
| Dados que pareciam ter quantidade nula | 0 |

Fiz distinção entre 0 e -1. Dados nulos podem e devem entrar na quantidade relativa e absoluta. Dados não recebidos não devem entrar. Os dados não obtidos (-1) não devem alterar somas pois podem ser filtrados apenas tomando valores inteiro positivos e nulos.