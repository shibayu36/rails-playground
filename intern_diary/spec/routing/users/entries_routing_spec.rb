# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::EntriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/entries').to route_to('users/entries#index')
    end

    it 'routes to #new' do
      expect(get: '/users/entries/new').to route_to('users/entries#new')
    end

    it 'routes to #show' do
      expect(get: '/users/entries/1').to route_to('users/entries#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/entries/1/edit').to route_to('users/entries#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/entries').to route_to('users/entries#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/entries/1').to route_to('users/entries#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/entries/1').to route_to('users/entries#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/entries/1').to route_to('users/entries#destroy', id: '1')
    end
  end
end
