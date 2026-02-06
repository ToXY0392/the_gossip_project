# lib/controller.rb

require_relative 'gossip'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
  end

  # CREATE
  def create_gossip
    # 1. Demander les infos à l'utilisateur via la view
    params = @view.create_gossip
    # params est un hash du type { author: "Jean", content: "blabla" }

    # 2. Créer un nouvel objet Gossip
    gossip = Gossip.new(params[:author], params[:content])

    # 3. Sauvegarder dans le CSV
    gossip.save

    # 4. Confirmation utilisateur
    @view.confirm_gossip_created
  end

  # READ (index)
  def index_gossips
    # 1. Demander au model tous les gossips
    gossips = Gossip.all

    # 2. Passer ces gossips à la view pour affichage
    @view.index_gossips(gossips)
  end

  # DESTROY
  def delete_gossip
    # 1. Récupérer tous les gossips
    gossips = Gossip.all

    if gossips.empty?
      @view.no_gossips_to_delete
      return
    end

    # 2. Afficher la liste numérotée
    @view.index_gossips(gossips)

    # 3. Demander à l'utilisateur quel index supprimer
    index_to_delete = @view.ask_gossip_index_to_delete

    # 4. Demander au model de supprimer ce gossip
    if Gossip.delete(index_to_delete)
      @view.confirm_gossip_deleted
    else
      @view.delete_error
    end
  end
end
