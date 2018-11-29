# frozen_string_literal: true

require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  def test_unmatched_scope
    person_1 = create_person
    person_2 = create_person
    person_3 = create_person(status: :newcomer)
    person_4 = create_person(status: :established)
    create_match(newcomer: person_3, established: person_4)

    assert_equal [
      person_1.id,
      person_2.id
    ], Person.unmatched.pluck(:id)
  end

  def test_matched_scope
    create_person
    create_person
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert_equal [
      person_1.id,
      person_2.id
    ], Person.matched.pluck(:id)
  end

  def test_interested_scope
    person_1 = create_person(engaged: false)

    assert_equal [
      person_1.id
    ], Person.interested.pluck(:id)
  end

  def test_engaged_scope
    person_1 = create_person(engaged: true)

    assert_equal [
      person_1.id
    ], Person.engaged.pluck(:id)
  end

  def test_pending_scope
    create_person
    create_person
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(newcomer: person_1, established: person_2)

    assert_equal [
      person_1.id,
      person_2.id
    ], Person.pending.pluck(:id)
  end

  def test_active_scope
    create_person
    create_person
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.from_now
    )

    assert_equal [
      person_1.id,
      person_2.id
    ], Person.active.pluck(:id)
  end

  def test_concluded_scope
    create_person
    create_person
    person_1 = create_person(status: :newcomer)
    person_2 = create_person(status: :established)
    create_match(
      newcomer: person_1,
      established: person_2,
      started_at: 1.day.ago,
      concluded_at: 1.day.ago
    )

    assert_equal [
      person_1.id,
      person_2.id
    ], Person.concluded.pluck(:id)
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
