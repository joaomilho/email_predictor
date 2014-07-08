module EmailPredictor
  class Dataset
    def initialize(emails)
      @emails = emails.map { |email| Email.new(email) }
    end

    def [](domain)
      dataset[domain] or []
    end

    private

    def dataset
      @dataset ||= Hash[patterns_by_relevance]
    end

    def patterns_by_relevance
      pattern_count.map do |domain, patterns|
        [domain, patterns.sort_by_relevance]
      end
    end

    def pattern_count
      @emails.each_with_object({}) do |email, domains|
        domains[email.domain] ||= Hash.new(0)
        domains[email.domain][email.pattern] += 1 if email.pattern
      end
    end
  end
end
