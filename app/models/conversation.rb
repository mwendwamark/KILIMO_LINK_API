# app/models/conversation.rb
class Conversation < ApplicationRecord
  # Relationships
  has_many :conversation_participants, dependent: :destroy
  has_many :users, through: :conversation_participants
  has_many :messages, dependent: :destroy
end
