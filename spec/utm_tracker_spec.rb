# frozen_string_literal: true

RSpec.describe UtmTracker::Client do
  subject { described_class.new(object, utm_data) }

  let(:object) { double('Object', :update! => true)}

  before { subject.call }

  context 'generate utm tags' do
    let(:utm_data) do
      {
        'source' => 'google',
        'medium' => 'cpc',
        'content' => 'landing_page',
        'campaign' => 'promo',
        'term' => 'free'
      }
    end

    it 'return utm_source' do
      expect(subject.utm_matcher.utm[:utm_source]).to eq 'google'
    end

    it 'return utm_medium' do
      expect(subject.utm_matcher.utm[:utm_medium]).to eq 'cpc'
    end

    it 'return utm_content' do
      expect(subject.utm_matcher.utm[:utm_content]).to eq 'landing_page'
    end

    it 'return utm_campaign' do
      expect(subject.utm_matcher.utm[:utm_campaign]).to eq 'promo'
    end

    it 'return utm_term' do
      expect(subject.utm_matcher.utm[:utm_term]).to eq 'free'
    end
  end
end
