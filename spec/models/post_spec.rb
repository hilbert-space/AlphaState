require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:content) }

  context 'when there is a record in the other locale' do
    before :each do
      create :post, locale: I18n.alternative_locale
    end

    it { should validate_uniqueness_of(:address).scoped_to(:locale) }
  end

  it 'should automatically fill in the locale field' do
    one = create :post, locale: nil
    expect(one.locale.to_s).to eq(I18n.locale.to_s)
  end

  it 'should automatically fill in the date field' do
    one = create :post, date: nil
    expect(one.date).not_to be_blank
  end
end