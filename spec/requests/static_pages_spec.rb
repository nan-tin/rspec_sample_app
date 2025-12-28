require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "root" do
    it "正常にレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status 200
    end
  end

  describe "#home" do
    it "正常にレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status 200
    end

    it "Ruby on Rails Tutorial sample Appが含まれること" do
      get root_path
      expect(response.body).to include full_title("")
    end
  end

  describe "#help" do
    it "正常にレスポンスを返すこと" do
      get help_path
      expect(response).to have_http_status 200
    end

    it "Help | Ruby on Rails Tutorial sample Appが含まれること" do
      get help_path
      expect(response.body).to include full_title("Help")
    end
  end

  describe "#about" do
    it "正常にレスポンスを返すこと" do
      get about_path
      expect(response).to have_http_status 200
    end

    it "About | Ruby on Rails Tutorial sample Appが含まれること" do
      get about_path
      expect(response.body).to include full_title("About")
    end
  end

  describe "#contact" do
    it "正常にレスポンスを返すこと" do 
      get contact_path
      expect(response).to have_http_status 200
    end

    it "Contact | Ruby on Rails Tutorial sample Appが含まれること" do
      get contact_path
      expect(response.body).to include full_title("Contact")
    end
  end
end
