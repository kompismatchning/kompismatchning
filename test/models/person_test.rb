# frozen_string_literal: true

require "test_helper"

class PersonTest < ActiveSupport::TestCase
  def test_unmatched_scope_included
    person = create_person(status: :newcomer)

    assert Person.unmatched.include?(person)
  end

  def test_unmatched_scope_not_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert_not Person.unmatched.include?(person_1)
    assert_not Person.unmatched.include?(person_2)
  end

  def test_matched_scope_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert Person.matched.include?(person_1)
    assert Person.matched.include?(person_2)
  end

  def test_matched_scope_not_included
    person = create_person(status: :newcomer)

    assert_not Person.matched.include?(person)
  end

  def test_interested_scope_included
    person = create_person(engaged: false)

    assert Person.interested.include?(person)
  end

  def test_interested_scope_not_included
    person = create_person(engaged: true)

    assert_not Person.interested.include?(person)
  end

  def test_engaged_scope_included
    person = create_person(engaged: true)

    assert Person.engaged.include?(person)
  end

  def test_engaged_scope_not_included
    person = create_person(engaged: false)

    assert_not Person.engaged.include?(person)
  end

  def test_pending_scope_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert Person.pending.include?(person_1)
    assert Person.pending.include?(person_2)
  end

  def test_pending_scope_not_included
    person = create_person

    assert_not Person.pending.include?(person)
  end

  def test_active_scope_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.from_now
    )

    assert Person.active.include?(person_1)
    assert Person.active.include?(person_2)
  end

  def test_active_scope_not_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert_not Person.active.include?(person_1)
    assert_not Person.active.include?(person_2)
  end

  def test_concluded_scope_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.ago
    )

    assert Person.concluded.include?(person_1)
    assert Person.concluded.include?(person_2)
  end

  def test_concluded_scope_not_included
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert_not Person.concluded.include?(person_1)
    assert_not Person.concluded.include?(person_2)
  end

  def test_interested_when_not_engaged
    assert Person.new(engaged: false).interested?
  end

  def test_interested_when_engaged
    assert_not Person.new(engaged: true).interested?
  end

  def test_engage
    person = create_person(engaged: false)
    person.engage
    assert person.engaged
  end

  def test_current_match
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    match = create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.from_now
    )

    assert_equal match.id, person_1.current_match.id
    assert_equal match.id, person_2.current_match.id
  end

  def test_currently_matched_with
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.from_now
    )

    assert_equal person_2, person_1.currently_matched_with
    assert_equal person_1, person_2.currently_matched_with
  end
end
