module Admin
  module MatchHelper
    def match_status_class(match)
      case match.status
      when "good"
        "success"
      when "warning"
        "warning"
      when "bad"
        "danger"
      else
        "default"
      end
    end
  end
end
