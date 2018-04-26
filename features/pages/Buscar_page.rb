class Buscar < SitePrism::Page
    element :menuBuscar, :xpath, '//a[contains(text(), "Buscar")]'
    element :idPesquisa, :xpath, '//input[@id = "idPesquisa"]'
    element :buttonPesquisar, :xpath, '//button[contains(@type, "submit")]'
    element :reserva, :xpath, '//div[@id = "pnlReservaList"]/div/table/thead/following-sibling::tbody/tr/td[9]/a'
    element :acoes, :xpath, '//span[contains(text(), "Ações")]'
    element :certeza, :xpath, '//span[contains(text(), "Confirmar")]'
    element :status_confirmado, :xpath, '//div[contains(text(), "CONFIRMADO")]'
    element :adicionar, :xpath, '//span[contains(text(), "Adicionar")]'
    element :pagamentos, :xpath, '//span[contains(text(), "Pagamentos")]'
    element :meio_pagto, :xpath, '//label[@id = "frmPagtoEdit:idSelPagtoTipo_label"]'
    element :tipomeio_pagto, :xpath, '//li[@data-label = "Cartão de crédito"]'
    element :num_doc, :xpath, '//input[@id = "frmPagtoEdit:idNrDocumento"]'
    element :nome_pagador, :xpath, '//input[@id = "frmPagtoEdit:idNmPagador"]'
    element :confirm_pagamento, :xpath, '//button[contains(@id, "frmPagtoEdit")]/span/following-sibling::span[contains(text(), "Confirmar")]'
    element :titular_cartao, :xpath, '//input[@id = "frmPagtoEdit:j_idt517:idNmTitularCartao"]'
    element :num_cartao, :xpath, '//input[@id = "frmPagtoEdit:j_idt517:idNRCartao"]'
    element :num_seg_cartao, :xpath, '//input[@id = "frmPagtoEdit:j_idt517:idCdSegurancaCartao"]'
    element :cep_pagante, :xpath, '//input[@id ="frmPagtoEdit:idCep"]'
    element :cel_pagante, :xpath, '//input[@id = "frmPagtoEdit:idTelefoneFixo"]'
    element :email_pagante, :xpath, '//input[@id = "frmPagtoEdit:idEmail"]'
    element :nasc_pagante, :xpath, '//input[@id = "frmPagtoEdit:idDtNascimento"]'
    element :numero_end, :xpath, '//input[@id = "frmPagtoEdit:idNREndereco"]'
    
  

def changeIframe
    page.driver.browser.switch_to.frame 0
end

def pesquisarReserva
    sleep 1
    idPesquisa.set('1082')
    buttonPesquisar.click
    has_xpath?('//span[contains(text(), "Resultado de sua pesquisa")]')
    reserva.click
end

def confirmar
    acoes.click
    certeza.click
    has_xpath?('//span[contains(text(), "Deseja realmente confirmar esta reserva")]')  
    confirmar = all(:xpath, '//button[@type = "button"]/span/following-sibling::span')
    confirmar[0].click
    status_confirmado
end

def pagarReserva
    adicionar.click 
    pagamentos.click
    meio_pagto.click
    tipomeio_pagto.click
    num_doc.set(Faker::CPF.number)
    nome_pagador.set(Faker::Name.name)  
    titular_cartao.set(Faker::Name.name) 
    num_cartao.set('4123652365236523')
    num_seg_cartao.set('123')
    cep_pagante.set('003335010')
    cel_pagante.set('011111111111')
    email_pagante.set(Faker::Internet.email)
    nasc_pagante.set('022041994')
    numero_end.set('10')
end

end