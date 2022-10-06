class Video < ApplicationRecord
  belongs_to :category
  has_one_attached :video do |attachable|
    attachable.variant :thumb, resize_to_limit: [64, 64]
    attachable.variant :thumb, resize_to_limit: [128, 128]
    attachable.variant :thumb, resize_to_limit: [256, 256]
  end

  validates :title, :video, presence: true
  validates :video, blob: { content_type: ['video/mp4', 'video/mov'], size_range: 1..200.megabytes }
end
