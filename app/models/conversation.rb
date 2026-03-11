class Conversation < ApplicationRecord
  has_many :conversation_participants, dependent: :destroy
  has_many :users, through: :conversation_participants
  has_many :messages, dependent: :destroy

  # Find a private conversation between two users
  def self.between(user1_id, user2_id)
    joins(:conversation_participants)
      .where(conversation_participants: { user_id: [user1_id, user2_id] })
      .group("conversations.id")
      .having("COUNT(conversation_participants.id) = 2")
      .first
  end
end
