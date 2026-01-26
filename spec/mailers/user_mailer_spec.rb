require 'rails_helper'
 
RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.account_activation(user) }
 
    before do
      user.activation_token = User.new_token
    end
 
    it '"Account activation"というタイトルで送信されること' do
      expect(mail.subject).to eq('Account activation')
    end
 
    it '送信先が"to@example.org"であること' do
      expect(mail.to).to eq([user.email])
    end
 
    it '送信元が"sample_app@sandboxa40c6c5f00694d2c92e81a82a9941588.mailgun.org"であること' do
      expect(mail.from).to eq(["sample_app@sandboxa40c6c5f00694d2c92e81a82a9941588.mailgun.org"])
    end
 
    it 'メール本文にユーザ名が表示されていること' do
      expect(mail.body.encoded).to match(user.name)
    end
 
    it 'メール本文にユーザのactivation_tokenが表示されていること' do
      expect(mail.body.encoded).to match(user.activation_token)
    end

    it 'メール本文にユーザのemailが表示されていること' do
      expect(mail.body.encoded).to match(CGI.escape(user.email))
    end
  end
end
