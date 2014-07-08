class Hash
  def sort_by_relevance
    sort_by { |_, relevance| relevance }.reverse.map(&:first)
  end
end
