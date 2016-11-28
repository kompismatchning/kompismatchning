module Admin
  module MatchHelper
    def match_status_class(match)
      return "warning" if match.status_overdue?

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
