module Admin
  module MatchHelper
    def match_status_class(match)
      case match.status
      when "good"
        "success"
      when "bad"
        "danger"
      else
        ""
      end
    end
  end
end
