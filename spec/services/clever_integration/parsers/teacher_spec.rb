require 'rails_helper'

describe 'CleverIntegration::Parsers::Teacher' do

    info = auth_hash[:info]
    name = self.generate_name(info[:name][:first], info[:name][:last])
    {
      clever_id: info[:id],
      email: info[:email],
      name: name,
    }

  let!(:response) {
    {
      info: {
        id: '1',
        name: {first: 'john', last: 'smith'},
        email: 'teacher@gmail.com'
      }
    }
  }

  let!(:expected) {
    {
      clever_id: '1',
      email: 'teacher@gmail.com',
      name: 'John Smith'
    }
  }

  def subject
    CleverIntegration::Parsers::Teacher.run(response)
  end

  it 'works' do
    expect(subject).to eq(expected)
  end
end