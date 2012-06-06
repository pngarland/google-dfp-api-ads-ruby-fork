# Encoding: utf-8
#
# Authors:: api.dklimkin@gmail.com (Danial Klimkin)
#
# Copyright:: Copyright 2010, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# AdWords-specific credential handler.

require 'ads_common/credential_handler'
require 'adwords_api/api_config'

module AdwordsApi
  class CredentialHandler < AdsCommon::CredentialHandler
    # Whether we're making MCC-level requests.
    attr_accessor :use_mcc
    # Whether we're making validate-only requests.
    attr_accessor :validate_only
    # Whether we're making partial failure requests.
    attr_accessor :partial_failure

    def initialize(config)
      super(config)
      @use_mcc = false
      @validate_only = false
      @partial_failure = false
    end

    # Create the list of credentials to be used by the auth handler for header
    # generation.
    def credentials(credentials_override = nil)
      result = super(credentials_override)
      validate_headers_for_server(result)

      extra_headers = {
        'userAgent' => generate_soap_user_agent(),
        'developerToken' => result[:developer_token]
      }
      if !@use_mcc and result[:client_customer_id]
        extra_headers['clientCustomerId'] = result[:client_customer_id]
      end
      extra_headers['validateOnly'] = 'true' if @validate_only
      extra_headers['partialFailure'] = 'true' if @partial_failure
      result[:extra_headers] = extra_headers
      return result
    end

    # Generates string to user as user agent in HTTP headers.
    def generate_http_user_agent(extra_ids = [])
      extra_ids, agent_app = get_user_agent_data(extra_ids)
      super(extra_ids, agent_app)
    end

    # Generates string to user as user agent in SOAP headers.
    def generate_soap_user_agent(extra_ids = [])
      extra_ids, agent_app = get_user_agent_data(extra_ids)
      super(extra_ids, agent_app)
    end

    private

    # Returns agent name and data for user-agent string generation.
    def get_user_agent_data(extra_ids)
      agent_app = @config.read('authentication.user_agent')
      extra_ids << ["AwApi-Ruby/%s" % AdwordsApi::ApiConfig::CLIENT_LIB_VERSION]
      return [extra_ids, agent_app]
    end

    # Validates that the right credentials are being used for the chosen
    # environment.
    #
    # Raises:
    # - AdsCommon::Error::EnvironmentMismatchError if sandbox credentials are
    # being used for production or vice-versa.
    # - AdwordsApi::Errors:BadCredentialsError if supplied credentials are not
    # valid.
    #
    def validate_headers_for_server(credentials)
      if credentials[:client_email]
        raise AdwordsApi::Errors::BadCredentialsError, 'Deprecated header ' +
            'clientEmail is no longer supported, please use clientCustomerId'
      end

      client_customer_id = credentials[:client_customer_id]
      if client_customer_id and
          !(client_customer_id.is_a?(Integer) or
            (client_customer_id =~ /^\d+(-\d+-\d+)?$/))
        raise AdwordsApi::Errors::BadCredentialsError,
            'Invalid client customer ID: %s' % client_customer_id.to_s
      end

      token = credentials[:developer_token]
      sandbox_token = (token =~ /.+@.+\+\+[a-zA-Z]{3}/)
      environment = @config.read('service.environment')
      case environment
        when :PRODUCTION
          if sandbox_token
            raise AdsCommon::Errors::EnvironmentMismatchError,
                'Attempting to connect to production with sandbox credentials.'
          end
        when :SANDBOX
          if (!sandbox_token)
            raise AdsCommon::Errors::EnvironmentMismatchError,
                'Attempting to connect to the sandbox with malformatted ' +
                'credentials. Please check http://code.google.com/apis/' +
                'adwords/docs/sandbox.html#request-headers for details.'
          end
      end
      return nil
    end
  end
end
