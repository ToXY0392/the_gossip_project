# lib/gossip.rb

require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author  = author
    @content = content
  end

  # Sauvegarde l'instance courante dans le CSV
  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  # Retourne un array de Gossip : [gossip1, gossip2, ...]
  def self.all
    all_gossips = []

    # Retour anticipé si le fichier n'existe pas encore
    return all_gossips unless File.exist?("db/gossip.csv")

    CSV.read("db/gossip.csv").each do |row|
      # row[0] = author, row[1] = content
      all_gossips << Gossip.new(row[0], row[1])
    end

    return all_gossips
  end

  # Supprime un gossip par son index (1 = premier gossip)
  # Retourne true si suppression OK, false sinon
  def self.delete(index)
    gossips = Gossip.all

    # index utilisateur 1-based -> index array 0-based
    array_index = index.to_i - 1

    return false if array_index.negative? || array_index >= gossips.length

    # On retire l'élément
    gossips.delete_at(array_index)

    # On réécrit complètement le CSV
    CSV.open("db/gossip.csv", "wb") do |csv|
      gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end

    return true
  end
end
class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("db/gossip.csv").each do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    all_gossips
  end

  def self.delete(index)
    # …
  end
end
