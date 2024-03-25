require 'rails_helper'
# Reservation.create(name: 'Alpha', email: 'alpha@example.com', phone: '(619)123-4567', guests: 2)

RSpec.describe Reservation, type: :model do
  it 'is not valid without a name' do
    r = Reservation.create(email: 'alpha@example.com', phone: '(619)123-4567', guests: 2)
    expect(r.errors[:name].first).to eq("can't be blank")
  end
  it 'is not valid without an email' do
    r = Reservation.create(name: 'Alpha', phone: '(619)123-4567', guests: 2)
    expect(r.errors[:email].first).to eq("can't be blank")
  end
  it 'is not valid without a phone number' do
    r = Reservation.create(name: 'Alpha', email: 'alpha@example.com', guests: 2)
    expect(r.errors[:phone].first).to eq("can't be blank")
  end
  it 'is not valid with duplicate emails' do
    r = Reservation.create(name: 'Alpha', email: 'alpha@example.com', phone: '(619)123-4567', guests: 2)
    r_failing = Reservation.create(name: 'Alpha', email: 'alpha@example.com', phone: '(619)123-4567', guests: 2)
    expect(r_failing.errors[:email].first).to eq('has already been taken')
  end
end
