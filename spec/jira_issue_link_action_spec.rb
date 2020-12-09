describe Fastlane::Actions::JiraIssueLinkAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The jira_issue_link plugin is working!")

      Fastlane::Actions::JiraIssueLinkAction.run(nil)
    end
  end
end
