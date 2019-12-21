# frozen_string_literal: true

# SectionEdits keep track of the edits made by AdminUsers on sections
class SectionEdit < ApplicationRecord
  belongs_to :admin_user
  belongs_to :section
end
