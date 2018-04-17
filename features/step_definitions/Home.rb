  Então("deverá ser exibido os Menus") do |table|
    $homePage = HomePage.new
    $homePage.ValidarMenu(table)
  end
