
describe "post" do
  context "when new user" do
    let(:result) { ApiUser.save(build(:user).to_hash) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when duplicated email" do
    let(:result) { ApiUser.save(build(:user_duplicated_email).to_hash) }

    it { expect(result.response.code).to eql "409" }
    it { expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
  end

  context "when wrong email" do
    let(:result) { ApiUser.save(build(:user_wrong_email).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end

  context "when empty name" do
    let(:result) { ApiUser.save(build(:empty_user_name).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
  end

  context "when empty email" do
    let(:result) { ApiUser.save(build(:empty_user_email).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
  end

  context "when empty password" do
    let(:result) { ApiUser.save(build(:empty_user_password).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
  end

  context "when null name" do
    let(:result) { ApiUser.save(build(:null_user_name).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Users.full_name cannot be null" }
  end

  context "when null email" do
    let(:result) { ApiUser.save(build(:null_user_email).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Users.email cannot be null" }
  end

  context "when null password" do
    let(:result) { ApiUser.save(build(:null_user_password).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Users.password cannot be null" }
  end
end
