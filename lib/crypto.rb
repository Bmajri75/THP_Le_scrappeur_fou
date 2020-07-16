# je requiere les Module besoin 
require 'nokogiri'
require 'open-uri'


# je cree ma methode 
def recherche_donee
    # je verifie si je recupere les data le xpath et mes key
    # efectue mes controle 

    page = open_url("https://coinmarketcap.com/all/views/all/")
    # si ma page contien des data je renvoie data extrait 
    if  page == true
        puts "Succee" + "... Data extrait" 
    # sinon je renvoie message erreur 
    else page == fals 
        puts "Error" + "... Data Error" 
    end

    donnee_key = page.xpath("//a[@class='currency-name-container link-secondary']")
    # si == true et que ma liste detien quelque chose renvoie le msg 
    if donnee_key == true
        puts "Succes" + "... liste des donne Coin est extrait" 
    # Sinon == False message d'erreur 
    else donnee_key == fals
        puts "Error" + "... iste des donne Coin est Non-extrait"
    end
    # 
    donne_valeur = page.xpath("//a[@class='price']")
    if donne_valeur == true
    puts " ... Prix recuperer"
    else donne_valeur == fals
    puts " ... prix non recuperer" .any?
    end
    
    
    # je cree un Array Vide que je vais inplementer avec le Hash Key : Valeur 
	crypto_Array = []
	crypto_Array = make_hash(donnee_key,donne_valeur)

    if crypto_Array == true
     puts " le Hash est cree le voici "
     # je retourne le resultat
    return crypto_Array
    # si le hash se passe mal je rend un fals avec un message
    else crypto_Array == fals
    puts "le Hash est pas cree" 
    end  
end
# fin de ma methode 


def open_url(link)
	# return nil if (link.empty? || link.nil?)
	page = Nokogiri::HTML(open(link))
	if page
		puts "Succes ... l'URL estconecter la voici"
		return page
	else
		puts "page non extrait" 
		return nil
	end
end
def make_hash (list_key,list_value)
	return nil if (!donnee_key.kind_of?(Nokogiri::XML::NodeSet) || donne_valeur!.kind_of?(Nokogiri::XML::NodeSet))
	tmp_hash = []
	for a in 0..donnee_key.size-1 do
		tmp_hash[a] = Hash.new
		tmp_hash[a][donnee_key[a].text]=donne_valeur[a].text
	end
	return tmp_hash
end