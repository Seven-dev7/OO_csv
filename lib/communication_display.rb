class CommunicationDisplay
  def self.introduction
    p "Hello"
    p 'Bienvenue sur le csv parser de gueDin'
  end

  def self.chosen_value
    p "Choisissez le chiffre correspondant au fichier csv choisi"
  end
  
  def self.chose_ur_keys(keys: )
    p "Quelles clés veux tu récuperez ?"
    p keys
  end

  def self.chosen_keys
    p "Ecrire chaque clé choisi séparer d'une virgule"
    print "-------->"
  end

  def self.get_ur_file
    p ""
    p "Récupérer votre fichier dans le dossier /new_csv"
  end
end
