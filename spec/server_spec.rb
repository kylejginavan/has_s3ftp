require 'spec_helper'

describe HasS3ftp::Server do
  let(:server) {HasS3ftp::Server.new({:aws_key=>"aws-key", :aws_secret=>"aws-secrect", :aws_bucket=>"ftp-chebyte", :email=>"email"}) }

  context "#email_client" do
    it "should create a new instance of sendgrid" do
      server.email_client.should be_an_instance_of(SendGridWebApi::Client)
    end
  end

  context "#notification_error" do
    it "should call to mail method" do
      error = mock("error")
      mail  = mock("email")
      server.email_client.stub!(:mail).and_return(mail)
      mail.stub!(:send).and_return(true)
      server.notification_error(error)
    end
  end

  context "#start" do
    # it "should send notification when try to start with errors" do
    #   EM.stub!(:FTPD).and_return(raise)
    #   server.should_receive(:notification_error)
    #   server.start
    # end
  end

end