# frozen_string_literal: true

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

    def time_ago_in_words_with_preposition(date)
      if date < Time.zone.now
        "för #{time_ago_in_words(date)} sedan"
      else
        "om #{time_ago_in_words(date)}"
      end
    end
  end
end
