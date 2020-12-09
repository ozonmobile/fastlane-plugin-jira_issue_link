require 'fastlane/action'
require_relative '../helper/jira_issue_link_helper'

module Fastlane
  module Actions
    class JiraIssueLinkAction < Action
      def self.run(params)
        Actions.verify_gem!('jira-ruby')
        require 'jira-ruby'

        site         = params[:url]
        auth_type    = :basic
        context_path = params[:context_path]
        username     = params[:username]
        password     = params[:password]

        ticket_id    = params[:ticket_id]

        global_id    = params[:global_id]
        relationship = params[:relationship]
        application  = params[:application]
        object       = params[:object]

        options = {
                    site: site,
                    context_path: context_path,
                    auth_type: auth_type,
                    username: username,
                    password: password
                  }

        client = JIRA::Client.new(options)
        issue = client.Issue.find(ticket_id)

        remote_link = issue.remotelink.build

        puts(options[:ticket_id])
        puts(options[:object])
        remote_link.save(
            {
                :globalId => global_id,
                :application => application,
                :relationship => relationship,
                :object => object
            }
        )
      end

      def self.description
        "Plugin to add remote link to jira issue"
      end

      def self.authors
        ["Aleksey Novikov"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Plugin to add remote link to jira issue"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                      env_name: "FL_JIRA_SITE",
                      description: "URL for Jira instance",
                      verify_block: proc do |value|
                       UI.user_error!("No url for Jira given, pass using `url: 'url'`") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :context_path,
                      env_name: "FL_JIRA_CONTEXT_PATH",
                      description: "Appends to the url (ex: \"/jira\")",
                      optional: true,
                      default_value: ""),
          FastlaneCore::ConfigItem.new(key: :username,
                      env_name: "FL_JIRA_USERNAME",
                      description: "Username for JIRA instance",
                      verify_block: proc do |value|
                        UI.user_error!("No username") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :password,
                      env_name: "FL_JIRA_PASSWORD",
                      description: "Password for Jira",
                      sensitive: true,
                      verify_block: proc do |value|
                        UI.user_error!("No password") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :ticket_id,
                      env_name: "FL_JIRA_TICKET_ID",
                      description: "Ticket ID for Jira, i.e. IOS-123",
                      verify_block: proc do |value|
                        UI.user_error!("No Ticket specified") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :global_id,
                      description: "A globally unique link identifier see https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/",
                      optional: true),
          FastlaneCore::ConfigItem.new(key: :application,
                      description: "Remote application instance that stores the remote object see https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/",
                      optional: true,
                      default_value: {},
                      is_string: false),
          FastlaneCore::ConfigItem.new(key: :relationship,
                      env_name: "FL_JIRA_LINK_RELATINOSHIP",
                      description: "Relationship between the remote object and the Jira issue used to group together links in the UI see https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/",
                      optional: true,
                      default_value: "links to"),
          FastlaneCore::ConfigItem.new(key: :object,
                      description: "The object in the remote system see https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/",
                      is_string: false)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
