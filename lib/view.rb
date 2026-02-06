# lib/view.rb

class View
  # Demande à l'utilisateur l'auteur + le contenu, retourne un hash
  def create_gossip
    puts "Quel est le nom de l'auteur du potin ?"
    print "> "
    author = gets.chomp

    puts "Balance le contenu du potin :"
    print "> "
    content = gets.chomp

    # IMPORTANT : on retourne bien un hash avec les bonnes clés
    { author: author, content: content }
  end

  # Affiche la liste des gossips
  def index_gossips(gossips)
    puts
    puts "----- LISTE DES GOSSIPS -----"

    if gossips.empty?
      puts "Aucun potin pour le moment, c'est tristoune..."
      return
    end

    gossips.each_with_index do |gossip, index|
      puts
      puts "##{index + 1}"
      puts "Auteur :  #{gossip.author}"
      puts "Contenu : #{gossip.content}"
    end

    puts
    puts "------------------------------"
  end

  # Demande à l'utilisateur quel gossip supprimer
  def ask_gossip_index_to_delete
    puts
    puts "Quel numéro de gossip veux-tu supprimer ?"
    print "> "
    gets.chomp.to_i
  end

  # Messages de confirmation / erreur
  def confirm_gossip_created
    puts
    puts "✅ Gossip bien créé et sauvegardé en base !"
  end

  def no_gossips_to_delete
    puts
    puts "Il n'y a aucun gossip à supprimer."
  end

  def confirm_gossip_deleted
    puts
    puts "🗑️ Gossip supprimé avec succès."
  end

  def delete_error
    puts
    puts "❌ Numéro invalide, aucun gossip supprimé."
  end
end
