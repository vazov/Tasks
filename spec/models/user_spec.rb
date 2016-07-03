require 'spec_helper'

describe User do
  describe "passwords" do
    it "needs a password and confirmation to save" do
      u = User.new(first_name: "Alexey")

      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(
            first_name: "Alexey",
            password: "aaaaab",
            password_confirmation: "aaaaaa")

      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
      first_name: "Alexey",
      password: "root123",
      password_confirmation: "root123") }

    it "authenticates with a correct password" do
      expect(user.authenticate("root123")).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("root122")).to_not be
    end
  end
end
