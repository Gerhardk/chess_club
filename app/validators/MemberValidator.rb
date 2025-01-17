class MemberValidator < ActiveModel::Validator
  def validate(record)
    return if record.player_one_id.nil?
    if record.player_one_id == record.player_two_id
      record.errors.add(:base, "Player one and Player two can not be the same member")
    end
  end
end