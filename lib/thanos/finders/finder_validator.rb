module Thanos
  class FinderValidator
    class << self
      def validate(params, allowed_params)
        not_allowed = params.keys - allowed_params
        unless not_allowed.empty?
          raise InvalidParamsError, "Invalid parameters: #{not_allowed}"
        end
        true
      end
    end
  end

  class InvalidParamsError < Exception; end
end
