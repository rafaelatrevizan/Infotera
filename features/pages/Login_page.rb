class LoginPage < SitePrism::Page
    element :usuario, :xpath, '//input[@id="j_idt15:j_idt17"]'
    element :senha, :xpath, '//input[@id="j_idt15:j_idt19"]'
    element :butonEntrar, :xpath, '//button[@id="j_idt15:j_idt21"]'
    element :senha2, :xpath, '//input[@id="frmAuth:j_idt42"]'
    element :confirmar, :xpath, '//span[contains(@class, "ui-button-text ui-c")]'
    element :texto, :xpath, '//div[contains(@style, "text-align:")]'


    def doLogin 
        $URL = "http://192.168.15.100:8080/infotravel/login.xhtml"
        visit $URL
    end

    def fillLogin
        usuario.set('homo')
        senha.set('homolog')
    end

    def fillPassword
        senha2.set('123456')
        confirmar.click
    end

end

