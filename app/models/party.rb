class Party < ApplicationRecord
  belongs_to :game
  has_many :solutions
  validates :word, presence: true

  def self.dictionnaire
    dico = []
    File.open("public/liste_francais.txt", "r").each_line do |line|
      dico << line.chomp
    end
    return dico # probleme avec les accents
  end

  DICTIONNAIRE = dictionnaire

  # création des 10 lettres en tableau
  def random_array
    letters = []
    5.times {  letters << ['A','E','Y', 'U', 'I', 'O'].sample }
    5.times {  letters << ('A'..'Z').to_a.difference(['A','E','Y', 'U', 'I', 'O']) .sample }
    return letters
  end

  #  trouver les meilleur les solutions avec les lettres
  def trouver_les_solution
    sorted_letters = @letters.sorted_sort
    sorted_dico = []
    self.dictionnaire.each { |word|
      sorted_dico << word.split(//).sort.join
    }
    # probleme de anagramme si on trouve pas de mot en dix lettre , je sais pas encore!!
  end

  #  verifie si le mot existe
  def avalaible?
    if ((word != '') && (DICTIONNAIRE.include?(word)))
      return true
    else
      return false
    end
  end
end
