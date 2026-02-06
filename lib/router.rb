# lib/router.rb

require_relative 'controller'

class Router
  def initialize
    # On veut qu'un "Router.new" crée automatiquement une instance "@controller"
    @controller = Controller.new
  end

  # app.rb fait "Router.new.perform"
  def perform
    puts "-------------------------------------"
    puts "   BIENVENUE DANS THE GOSSIP PROJECT"
    puts "-------------------------------------"

    while true
      puts
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Je veux afficher tous les gossips"
      puts "3. Je veux supprimer un gossip"
      puts "4. Je veux quitter l'app"

      print "> "
      params = gets.chomp.to_i

      case params
      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip

      when 2
        puts "Tu as choisi d'afficher tous les gossips"
        @controller.index_gossips

      when 3
        puts "Tu as choisi de supprimer un gossip"
        @controller.delete_gossip

      when 4
        puts "À bientôt !"
        break  # sort de la boucle while

      else
        puts "Ce choix n'existe pas, merci de ressayer"
        # La boucle continue, il peut se tromper jusqu'à la fin des temps 🙂
      end
    end
  end
end
