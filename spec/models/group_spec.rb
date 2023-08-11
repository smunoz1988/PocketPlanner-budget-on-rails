require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'Medicines', icon: 'health.png', author_id: 4) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'subject name should be equal to Medicines' do
    expect(subject.name).to eq('Medicines')
  end

  it 'subject icon should be equal to health.png' do
    expect(subject.icon).to eq('health.png')
  end

  it 'subject author_id should be equal to 4' do
    expect(subject.author_id).to eq(4)
  end
end
