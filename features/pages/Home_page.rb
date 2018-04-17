class HomePage < SitePrism::Page

    def ValidarMenu (menuEsperado)
        j = 0
        menuEsperado.hashes.each do |item|
           find(:xpath, '//a[contains(text(), "'+ item["Menu"] +'")]')
           j += 1 
        end 
    end

end