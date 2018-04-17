Dado("que esteja na Home do Portal") do
    $loginInfotera = LoginPage.new     
    $loginInfotera.doLogin   
    $loginInfotera.fillLogin
    $loginInfotera.butonEntrar.click
    $loginInfotera.fillPassword
    $loginInfotera.texto
end

