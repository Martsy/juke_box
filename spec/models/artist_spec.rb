# frozen_string_literal: true

require 'rails_helper'

describe Artist, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :songs }
  end

  describe 'instance methods' do
    it '.average_song_length' do
      britney_spears = Artist.create!(name: 'Britney Spears')
      haddaway = Artist.create!(name: 'Haddaway')
      hit_me = britney_spears.songs.create!(title: 'Hit Me Baby One More Time', length: 345, play_count: 10)
      toxic = britney_spears.songs.create!(title: 'Toxic', length: 255, play_count: 12)
      what_love = haddaway.songs.create!(title: 'What is Love', length: 543, play_count: 2)

      expect(britney_spears.average_song_length).to eq(300)
    end
  end
end
