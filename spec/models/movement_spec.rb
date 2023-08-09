require 'rails_helper'

RSpec.describe Movement, type: :model do
  subject { Movement.new(name: 'Burguer and fries', amount: 6.30, author_id: 4, group_id: 54) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'group_id should be present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'subject name should be equal to Burguer and fries' do
    expect(subject.name).to eq('Burguer and fries')
  end

  it 'subject amount should be equal to 6.30' do
    expect(subject.amount).to eq(6.30)
  end

  it 'subject author_id should be equal to 4' do
    expect(subject.author_id).to eq(4)
  end

  it 'subject group_id should be equal to 54' do
    expect(subject.group_id).to eq(54)
  end
end