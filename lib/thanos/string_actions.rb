module Thanos
  class StringActions
    def self.parameterize(string)
      string.split(/(?=[A-Z])/).join('_').downcase
    end
  end
end
