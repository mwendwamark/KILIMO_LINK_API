# app/models/conversation_participant.rb
class ConversationParticipant < ApplicationRecord
  # Relationships
  belongs_to :conversation
  belongs_to :user
end
