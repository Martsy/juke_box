# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song do
  describe 'validations' do
    it { should validate_presence_of :title }
  end

  describe 'relationships' do
    it { should belong_to :artist }
  end

  describe 'class methods ' do
    it '.song_count' do
      britney_spears = Artist.create!(name: 'Britney Spears')
      haddaway = Artist.create!(name: 'Haddaway')
      hit_me = britney_spears.songs.create!(title: 'Hit Me Baby One More Time', length: 345, play_count: 10)
      what_love = haddaway.songs.create!(title: 'What is Love', length: 543, play_count: 2)

      expect(Song.song_count).to eq(2)
    end
  end
end
